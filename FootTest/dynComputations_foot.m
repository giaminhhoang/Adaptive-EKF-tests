function [model,transforms,transposed_leg_ft] = dynComputations_foot(model,inertial,leg_ft,transforms,leg_choice,expPath,tMax,dtKalman);


fprintf('\nPlease wait while transforming the Leg FT sensor measurements to the Foot FT sensor frame... \n');
%Defining object of DynamicsComputations
dynComp = iDynTree.DynamicsComputations();

%% Load robot urdf
%Loading urdf of corresponding robot
loadModel = dynComp.loadRobotModelFromFile(strcat(model.urdf,'.urdf'),'urdf'); % Loading iCubGenova03 model.urdf
regCheck = dynComp.isValid(); %checking if regressor generator is correctly configured
dofInternal = dynComp.getNrOfDegreesOfFreedom();

%% Initialize link and frame indices
%Getting indices for base link frame - *_foot, leg FT frame - *_hip_3,
%world frame - locatd at *_sole at time t = 0, when robot is in upright
%standing position. (* = 'l' or 'r')
if(strcmp(leg_choice,'left')== 1)
    footCheck = dynComp.setFloatingBase('l_foot'); %Setting floating base to the l_foot
    base_link = dynComp.getFloatingBase();
    idx = dynComp.getFrameIndex(base_link);
    Nb = dynComp.getFrameIndex('l_hip_3');
    %     world = dynComp.getFrameIndex('l_sole');
    world = dynComp.getFrameIndex('l_foot_dh_frame');
else if(strcmp(leg_choice,'right')== 1)
        footCheck = dynComp.setFloatingBase('r_foot'); %Setting floating base to the l_foot
        base_link = dynComp.getFloatingBase();
        idx = dynComp.getFrameIndex(base_link);
        Nb = dynComp.getFrameIndex('r_hip_3');
        %         world = dynComp.getFrameIndex('r_sole');
        world = dynComp.getFrameIndex('r_foot_dh_frame');
    end
end


%% Set robot state at time t = 0
%Obtain joint states from torso, right leg and left leg
torso_state = importdata(strcat(expPath,'torso/state:o/data.log'));
torso.timeStamp = torso_state(:,2) - torso_state(1,2) ;
torso.q = torso_state(:,3:end).*(pi/180);
torso.dq = zeros(size(torso.timeStamp));
torso.ddq = zeros(size(torso.timeStamp));

right_leg_state = importdata(strcat(expPath,'right_leg/state:o/data.log'));
right_leg.timeStamp = right_leg_state(:,2) - right_leg_state(1,2) ;
right_leg.q = right_leg_state(:,3:end).*(pi/180);
right_leg.dq = zeros(size(right_leg.timeStamp));
right_leg.ddq = zeros(size(right_leg.timeStamp));

left_leg_state = importdata(strcat(expPath,'left_leg/state:o/data.log'));
left_leg.timeStamp = left_leg_state(:,2) - left_leg_state(1,2) ;
left_leg.q = left_leg_state(:,3:end).*(pi/180);
left_leg.dq = zeros(size(left_leg.timeStamp));
left_leg.ddq = zeros(size(left_leg.timeStamp));

% Obtaining joint velocities and accelerations using time derivatives of joint positions
torso = smoothAndEstimateVelAcc(torso);
right_leg = smoothAndEstimateVelAcc(right_leg);
left_leg = smoothAndEstimateVelAcc(left_leg);

%Obtaining acceleration and angular velocity from IMU
% TODO - properly map using COM_R_IMU

com_R_imu = transforms.B_R_imu;
a.q = (com_R_imu*inertial.data(:,4:6)')';
a.timeStamp = inertial.t;
a.dq = zeros(size(a.timeStamp));
a.ddq = zeros(size(a.timeStamp));
a = smoothAndEstimateVelAcc(a);

omega.q = (com_R_imu*inertial.data(:,7:9)')';
omega.timeStamp = inertial.t;
omega.dq = zeros(size(omega.timeStamp));
omega.ddq = zeros(size(omega.timeStamp));
omega = smoothAndEstimateVelAcc(omega);

%don't change order
[t,el] = min([length(a.timeStamp),length(omega.timeStamp),length(torso.timeStamp),length(right_leg.timeStamp),length(left_leg.timeStamp),length(leg_ft.t)]);


f_leg = [leg_ft.f leg_ft.mu];
fleg = iDynTree.Wrench();
ffoot = iDynTree.Wrench();
%%
q = iDynTree.VectorDynSize();
q_dot = iDynTree.VectorDynSize();
q_dotdot = iDynTree.VectorDynSize();
base_vel = iDynTree.Twist();
base_acc = iDynTree.ClassicalAcc();
world_T_base = iDynTree.Transform();
world_gravity = iDynTree.SpatialAcc();  %by default set to 0, because base acceleration includes gravity components
lin_vel = zeros(3,1);

state_set = zeros(t,1);
for i = 1 : t
    
    jointpos = zeros(dofInternal,1);
    jointpos(1:6,1) = left_leg.q(i,1:6);
    jointpos(7:12,1) = right_leg.q(i,1:6);
    jointpos(15,1) = torso.q(i,1);
    jointpos(14,1) = torso.q(i,2);
    jointpos(13,1) = torso.q(i,3);
    q.fromMatlab(jointpos);
    
    jointvel = zeros(dofInternal,1);
    jointvel(1:6,1) = left_leg.dq(i,1:6);
    jointvel(7:12,1) = right_leg.dq(i,1:6);
    jointvel(15,1) = torso.dq(i,1);
    jointvel(14,1) = torso.dq(i,2);
    jointvel(13,1) = torso.dq(i,3);
    q_dot.fromMatlab(jointvel);
    
    jointacc = zeros(dofInternal,1);
    jointacc(1:6,1) = left_leg.ddq(i,1:6);
    jointacc(7:12,1) = right_leg.ddq(i,1:6);
    jointacc(15,1) = torso.ddq(i,1);
    jointacc(14,1) = torso.ddq(i,2);
    jointacc(13,1) = torso.ddq(i,3);
    q_dotdot.fromMatlab(jointacc);
    
    
    ang_vel = omega.q(i,1:3)';
    base_vel.fromMatlab([lin_vel;ang_vel]);
    
    lin_acc = a.q(i,1:3)';
    ang_acc = omega.dq(i,1:3)';
    base_acc.fromMatlab([lin_acc;ang_acc]);
    
    state_set(i) = dynComp.setRobotState(q,q_dot,q_dotdot,world_T_base,base_vel,base_acc,world_gravity);
    
    %% Obtaining the foot inertial parameters and transforms at time t = 0
    if(state_set(1))
        %% Foot mass
        % Getting the foot mass and inertia matrix considering it as a single rigid body
        
        Ifoot = dynComp.getLinkInertia(base_link);
        mfoot = Ifoot.getMass(); % mass of the foot
        Icfoot = Ifoot.getRotationalInertiaWrtCenterOfMass();
        
        
        %% Transforms
        %Obtain the center of mass of the foot body wrt to footFt and
        %corresponding adjoint Transforms
        
        foot_p_B = Ifoot.getCenterOfMass();
        B_p_foot = -foot_p_B.toMatlab(); %due to symmetrical frames of reference
        transforms.B_adjT_ankle = [eye(3) zeros(3) ; -eye(3)*S(foot_p_B.toMatlab()) eye(3) ];
        
        
        
        model.m = mfoot;
        Ic = Icfoot.toMatlab();
        Ic = eye(3)*Ic*transpose(eye(3)) - S(foot_p_B.toMatlab())*S(foot_p_B.toMatlab())';
        model.I = Ic;
        
        
        %% world2body rotation
        %Getting world to body rotation, considering foot FT frame
        % and world frame to be located at l_sole but symmetrical in rotation wrt body frame
        %To obtain initial body configuration wrt world frame at time t = 0.
        
        
        %getting transform between l_sole and footFT
        footFT_R_sole = dynComp.getRelativeTransform(idx,world);
        
        
        % Adding a custom frame at the origin of l_sole but orientation
        % symmetrical to footFT frame and call it world frame/global frame
        % This is done so that we have a fixed inertial frame in which the
        % initial conditions can be set and the gravity is known.
        footFT_p_sole = footFT_R_sole.getPosition();
        footFT_R_sole = iDynTree.Rotation(0,0,1,0,1,0,-1,0,0);
        
        footFT_R_world = iDynTree.Transform(footFT_R_sole,footFT_p_sole);
        
        
        B_R_G = footFT_R_world.getRotation().toMatlab();
        G_R_B = B_R_G';
        model.phi0 = dcm2euler(G_R_B);
        model.phi0 = [0; pi/2; 0];
        
    end
    
    
    %% Transposing the Leg FT sensor measurements to foot
    footFT_X_legFT = dynComp.getRelativeTransform(idx,Nb);
    fleg.fromMatlab(f_leg(i,1:6)');
    ffoot= footFT_X_legFT*fleg;
    f_foot(i,1:6) = ffoot.toMatlab();
    for j = idx - 1 : -1 : Nb
        footFT_X_Nb = dynComp.getRelativeTransform(idx,j);
        
        Il = dynComp.getLinkInertia(j);
        m = Il.getMass();
        I = Il.getRotationalInertiaWrtCenterOfMass();
        I = I.toMatlab();
        
        acc = dynComp.getFrameProperSpatialAcceleration(j);
        a_link = acc.toMatlab();
        v_dot = a_link(1:3);
        omega_B_dot = a_link(4:6);
        
        v = dynComp.getFrameTwist(j);
        v_link = v.toMatlab();
        v = v_link(1:3);
        omega_B = v_link(4:6);
        
        h_dot = [m*eye(3)*v_dot + S(omega_B)*m*eye(3)*v; I*omega_B_dot + S(omega_B)*I*omega_B];
        hdot = iDynTree.Wrench();
        hdot.fromMatlab(h_dot);
        f_link = footFT_X_Nb*hdot;
        f_foot(i,1:6) = f_foot(i,1:6) - f_link.toMatlab()';
    end
    
end
transposed_leg_ft.f = f_foot(:,1:3);
transposed_leg_ft.mu = f_foot(:,4:6);
switch(el)
    case 1
        transposed_leg_ft.t = a.timeStamp(1:end);
    case 2
        transposed_leg_ft.t = omega.timeStamp(1:end);
    case 3
        transposed_leg_ft.t = torso.timeStamp(1:end);
    case 4
        transposed_leg_ft.t = right_leg.timeStamp(1:end);
    case 5
        transposed_leg_ft.t = left_leg.timeStamp(1:end);
    case 6
        transposed_leg_ft.t = leg_ft.t(1:end);
end


transposed_leg_ft.idx = (1:t)';
end
