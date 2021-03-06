function xn = forwardDynamicsDualState(x0, model)
dt = model.dtKalman;
odeSettings      = odeset('InitialStep', 1e-8, 'MaxStep', 1e-4);

 massSpringProcess = @(t,x)processExplicitODEDualState(x(1),x(2),x(3),model.m,model.k(1),model.k(2),model.c);
[~,x] = ode45(massSpringProcess,[0 dt],x0,odeSettings);



xn = x(end,:)';

end
