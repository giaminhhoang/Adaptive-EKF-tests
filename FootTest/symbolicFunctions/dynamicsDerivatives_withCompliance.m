function df_dx_withCompliance = dynamicsDerivatives_withCompliance(v_Bx,v_By,v_Bz,omega_Bx,omega_By,omega_Bz,f_B_ox,f_B_oy,f_B_oz,mu_B_ox,mu_B_oy,mu_B_oz,f_B_cx,f_B_cy,f_B_cz,mu_B_cx,mu_B_cy,mu_B_cz,phi1,phi2,phi3,k_xx,k_yy,k_zz,c_xx,c_yy,c_zz,phi01,phi02,phi03,I_Bxx,I_Bxy,I_Bxz,I_Byy,I_Byz,I_Bzz,m,G_g1,G_g2,G_g3)
%DYNAMICSDERIVATIVES_WITHCOMPLIANCE
%    DF_DX_WITHCOMPLIANCE = DYNAMICSDERIVATIVES_WITHCOMPLIANCE(V_BX,V_BY,V_BZ,OMEGA_BX,OMEGA_BY,OMEGA_BZ,F_B_OX,F_B_OY,F_B_OZ,MU_B_OX,MU_B_OY,MU_B_OZ,F_B_CX,F_B_CY,F_B_CZ,MU_B_CX,MU_B_CY,MU_B_CZ,PHI1,PHI2,PHI3,K_XX,K_YY,K_ZZ,C_XX,C_YY,C_ZZ,PHI01,PHI02,PHI03,I_BXX,I_BXY,I_BXZ,I_BYY,I_BYZ,I_BZZ,M,G_G1,G_G2,G_G3)

%    This function was generated by the Symbolic Math Toolbox version 6.2.
%    09-Oct-2015 13:54:04

t2 = 1.0./m;
t3 = sin(phi1);
t4 = sin(phi3);
t5 = cos(phi1);
t6 = cos(phi2);
t7 = cos(phi3);
t8 = sin(phi2);
t9 = t5.*t7;
t10 = t9-t3.*t4.*t6;
t11 = t3.*t7;
t12 = t4.*t5.*t6;
t13 = t11+t12;
t14 = t3.*t4;
t15 = t14-t5.*t6.*t7;
t16 = t4.*t5;
t17 = t3.*t6.*t7;
t18 = t16+t17;
t19 = I_Byz.^2;
t20 = I_Bxy.^2;
t21 = I_Bxz.^2;
t22 = I_Bxx.*t19;
t23 = I_Byy.*t21;
t24 = I_Bzz.*t20;
t29 = I_Bxx.*I_Byy.*I_Bzz;
t30 = I_Bxy.*I_Bxz.*I_Byz.*2.0;
t25 = t22+t23+t24-t29-t30;
t26 = 1.0./t25;
t27 = I_Byy.^2;
t28 = I_Bzz.^2;
t31 = t19-I_Byy.*I_Bzz;
t32 = I_Bxy.*I_Bzz;
t47 = I_Bxz.*I_Byz;
t33 = t32-t47;
t34 = I_Bxy.*I_Byz;
t56 = I_Bxz.*I_Byy;
t35 = t34-t56;
t36 = t26.*t35;
t37 = k_xx.^2;
t38 = k_yy.^2;
t39 = k_zz.^2;
t40 = I_Bxx.^2;
t41 = I_Byz.*omega_Bx.*t21.*2.0;
t42 = I_Bxz.*omega_By.*t19.*2.0;
t43 = I_Bxx.*I_Bxy.*I_Bzz.*omega_Bz;
t44 = I_Bxy.*I_Byy.*I_Bzz.*omega_Bz;
t45 = I_Bxz.*I_Byy.*I_Byz.*omega_Bz;
t46 = I_Bxz.*I_Byz.*I_Bzz.*omega_Bz;
t48 = t26.*t33;
t49 = t21-I_Bxx.*I_Bzz;
t50 = I_Bxx.*I_Byz;
t57 = I_Bxy.*I_Bxz;
t51 = t50-t57;
t52 = I_Byz.*omega_Bx.*t40;
t53 = I_Bxz.*omega_By.*t27;
t54 = I_Bxx.*I_Bxy.*I_Byz.*omega_By;
t55 = I_Bxy.*I_Bxz.*I_Byy.*omega_Bx;
t58 = t26.*t51;
t59 = t20-I_Bxx.*I_Byy;
t60 = 1.0./t8;
t61 = t7.^2;
t62 = t4.^2;
t63 = t61+t62;
t64 = 1.0./t63;
t65 = omega_Bx.*t7;
t66 = omega_By.*t4;
t67 = t65+t66;
t68 = 1.0./t8.^2;
df_dx_withCompliance = reshape([0.0,-omega_Bz,omega_By,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,omega_Bz,0.0,-omega_Bx,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-omega_By,omega_Bx,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,v_Bz,-v_By,-t26.*(t41+t42+t43+t44+t45+t46+t53+t54+c_xx.*t19-I_Byy.*I_Bzz.*c_xx-I_Bxy.*omega_Bz.*t19.*2.0-I_Byz.*omega_Bx.*t20.*2.0-I_Bxy.*omega_Bz.*t28-I_Bxx.*I_Bxz.*I_Byy.*omega_By+I_Bxy.*I_Bxz.*I_Byy.*omega_Bx.*2.0-I_Bxx.*I_Bxz.*I_Byz.*omega_Bz-I_Bxy.*I_Bxz.*I_Bzz.*omega_Bx.*2.0-I_Bxy.*I_Byy.*I_Byz.*omega_By-I_Bxy.*I_Byz.*I_Bzz.*omega_By-I_Bxz.*I_Byy.*I_Bzz.*omega_By),-t26.*(I_Bxy.*I_Bzz.*c_xx-I_Bxz.*I_Byz.*c_xx+I_Bxx.*omega_Bz.*t19-I_Bxz.*omega_Bx.*t20.*2.0+I_Bxx.*omega_Bz.*t21-I_Bxz.*omega_Bx.*t21.*2.0-I_Byz.*omega_By.*t21.*2.0-I_Bzz.*omega_Bz.*t20-I_Bzz.*omega_Bz.*t21+I_Bxx.*omega_Bz.*t28-I_Byz.*omega_By.*t40-I_Bzz.*omega_Bz.*t40+I_Bxx.*I_Bxy.*I_Bxz.*omega_By+I_Bxx.*I_Bxy.*I_Byz.*omega_Bx.*2.0+I_Bxx.*I_Bxz.*I_Bzz.*omega_Bx.*2.0+I_Bxx.*I_Byy.*I_Byz.*omega_By-I_Bxy.*I_Bxz.*I_Byy.*omega_By+I_Bxx.*I_Byz.*I_Bzz.*omega_By+I_Bxy.*I_Bxz.*I_Bzz.*omega_By),t26.*(I_Bxy.*I_Byz.*c_xx-I_Bxz.*I_Byy.*c_xx+I_Bxx.*omega_By.*t19+I_Bxx.*omega_By.*t20-I_Bxy.*omega_Bx.*t20.*2.0-I_Bxy.*omega_Bx.*t21.*2.0-I_Byy.*omega_By.*t20-I_Byy.*omega_By.*t21-I_Byz.*omega_Bz.*t20.*2.0+I_Bxx.*omega_By.*t27-I_Byy.*omega_By.*t40-I_Byz.*omega_Bz.*t40+I_Bxx.*I_Bxy.*I_Byy.*omega_Bx.*2.0+I_Bxx.*I_Bxy.*I_Bxz.*omega_Bz+I_Bxx.*I_Bxz.*I_Byz.*omega_Bx.*2.0+I_Bxx.*I_Byy.*I_Byz.*omega_Bz+I_Bxy.*I_Bxz.*I_Byy.*omega_Bz+I_Bxx.*I_Byz.*I_Bzz.*omega_Bz-I_Bxy.*I_Bxz.*I_Bzz.*omega_Bz),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t7.*t60.*t64,-t4.*t64,-t6.*t7.*t60.*t64,0.0,0.0,0.0,0.0,0.0,0.0,-v_Bz,0.0,v_Bx,t26.*(-I_Bxy.*I_Bzz.*c_yy+I_Bxz.*I_Byz.*c_yy-I_Bxz.*omega_Bx.*t19.*2.0+I_Byy.*omega_Bz.*t19-I_Byz.*omega_By.*t19.*2.0-I_Byz.*omega_By.*t20.*2.0+I_Byy.*omega_Bz.*t21-I_Bzz.*omega_Bz.*t19-I_Bzz.*omega_Bz.*t20-I_Bxz.*omega_Bx.*t27+I_Byy.*omega_Bz.*t28-I_Bzz.*omega_Bz.*t27-I_Bxx.*I_Bxy.*I_Byz.*omega_Bx+I_Bxx.*I_Bxz.*I_Byy.*omega_Bx+I_Bxy.*I_Bxz.*I_Byy.*omega_By.*2.0+I_Bxy.*I_Byy.*I_Byz.*omega_Bx+I_Bxy.*I_Byz.*I_Bzz.*omega_Bx+I_Bxz.*I_Byy.*I_Bzz.*omega_Bx+I_Byy.*I_Byz.*I_Bzz.*omega_By.*2.0),t26.*(t41+t42+t43+t44-t45+t46+t52+t55-c_yy.*t21+I_Bxx.*I_Bzz.*c_yy-I_Bxz.*omega_By.*t20.*2.0-I_Bxy.*omega_Bz.*t21.*2.0-I_Bxy.*omega_Bz.*t28-I_Bxx.*I_Bxy.*I_Bxz.*omega_Bx+I_Bxx.*I_Bxy.*I_Byz.*omega_By.*2.0-I_Bxx.*I_Byy.*I_Byz.*omega_Bx+I_Bxx.*I_Bxz.*I_Byz.*omega_Bz-I_Bxx.*I_Byz.*I_Bzz.*omega_Bx-I_Bxy.*I_Bxz.*I_Bzz.*omega_Bx-I_Bxy.*I_Byz.*I_Bzz.*omega_By.*2.0),-t26.*(I_Bxx.*I_Byz.*c_yy-I_Bxy.*I_Bxz.*c_yy-I_Bxx.*omega_Bx.*t19-I_Bxx.*omega_Bx.*t20-I_Bxy.*omega_By.*t19.*2.0-I_Bxy.*omega_By.*t20.*2.0+I_Byy.*omega_Bx.*t20+I_Byy.*omega_Bx.*t21-I_Bxz.*omega_Bz.*t20.*2.0-I_Bxx.*omega_Bx.*t27-I_Bxz.*omega_Bz.*t27+I_Byy.*omega_Bx.*t40+I_Bxx.*I_Bxy.*I_Byy.*omega_By.*2.0+I_Bxx.*I_Bxy.*I_Byz.*omega_Bz+I_Bxx.*I_Bxz.*I_Byy.*omega_Bz+I_Bxy.*I_Byy.*I_Byz.*omega_Bz+I_Bxz.*I_Byy.*I_Byz.*omega_By.*2.0-I_Bxy.*I_Byz.*I_Bzz.*omega_Bz+I_Bxz.*I_Byy.*I_Bzz.*omega_Bz),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t4.*t60.*t64,t7.*t64,-t4.*t6.*t60.*t64,0.0,0.0,0.0,0.0,0.0,0.0,v_By,-v_Bx,0.0,-t26.*(-I_Bxy.*I_Byz.*c_zz+I_Bxz.*I_Byy.*c_zz-I_Bxy.*omega_Bx.*t19.*2.0-I_Byy.*omega_By.*t19-I_Byy.*omega_By.*t21-I_Byz.*omega_Bz.*t19.*2.0+I_Bzz.*omega_By.*t19+I_Bzz.*omega_By.*t20-I_Byz.*omega_Bz.*t21.*2.0-I_Bxy.*omega_Bx.*t28-I_Byy.*omega_By.*t28+I_Bzz.*omega_By.*t27+I_Bxx.*I_Bxy.*I_Bzz.*omega_Bx-I_Bxx.*I_Bxz.*I_Byz.*omega_Bx+I_Bxy.*I_Byy.*I_Bzz.*omega_Bx+I_Bxz.*I_Byy.*I_Byz.*omega_Bx+I_Bxy.*I_Bxz.*I_Bzz.*omega_Bz.*2.0+I_Bxz.*I_Byz.*I_Bzz.*omega_Bx+I_Byy.*I_Byz.*I_Bzz.*omega_Bz.*2.0),t26.*(-I_Bxx.*I_Byz.*c_zz+I_Bxy.*I_Bxz.*c_zz-I_Bxx.*omega_Bx.*t19-I_Bxx.*omega_Bx.*t21-I_Bxy.*omega_By.*t21.*2.0-I_Bxz.*omega_Bz.*t19.*2.0+I_Bzz.*omega_Bx.*t20-I_Bxz.*omega_Bz.*t21.*2.0+I_Bzz.*omega_Bx.*t21-I_Bxx.*omega_Bx.*t28-I_Bxy.*omega_By.*t28+I_Bzz.*omega_Bx.*t40+I_Bxx.*I_Bxy.*I_Bzz.*omega_By+I_Bxx.*I_Bxz.*I_Byz.*omega_By+I_Bxx.*I_Bxz.*I_Bzz.*omega_Bz.*2.0+I_Bxy.*I_Byy.*I_Bzz.*omega_By-I_Bxz.*I_Byy.*I_Byz.*omega_By+I_Bxy.*I_Byz.*I_Bzz.*omega_Bz.*2.0+I_Bxz.*I_Byz.*I_Bzz.*omega_By),-t26.*(t52-t53+t54-t55+c_zz.*t20-I_Bxx.*I_Byy.*c_zz+I_Bxy.*omega_Bz.*t19.*2.0-I_Bxz.*omega_By.*t20.*2.0+I_Byz.*omega_Bx.*t20.*2.0-I_Bxy.*omega_Bz.*t21.*2.0-I_Bxx.*I_Bxy.*I_Bxz.*omega_Bx+I_Bxx.*I_Bxz.*I_Byy.*omega_By-I_Bxx.*I_Byy.*I_Byz.*omega_Bx+I_Bxx.*I_Bxz.*I_Byz.*omega_Bz.*2.0-I_Bxx.*I_Byz.*I_Bzz.*omega_Bx+I_Bxy.*I_Bxz.*I_Bzz.*omega_Bx+I_Bxy.*I_Byy.*I_Byz.*omega_By-I_Bxy.*I_Byz.*I_Bzz.*omega_By-I_Bxz.*I_Byy.*I_Byz.*omega_Bz.*2.0+I_Bxz.*I_Byy.*I_Bzz.*omega_By),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t60.*t64.*(t8.*t61+t8.*t62),0.0,0.0,0.0,0.0,0.0,0.0,-t2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t26.*t31,-t48,t36,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t26.*t33,-t26.*t49,-t58,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t36,-t26.*t51,-t26.*t59,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t2,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t26.*t31,t48,-t36,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t48,t26.*t49,t58,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t36,t58,t26.*t59,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-G_g2.*t15-G_g1.*t18,-G_g1.*t10-G_g2.*t13,-G_g1.*t3.*t8+G_g2.*t5.*t8,-t26.*(t19.*t37-I_Byy.*I_Bzz.*t37),-t26.*(I_Bxy.*I_Bzz.*t37-I_Bxz.*I_Byz.*t37),t26.*(I_Bxy.*I_Byz.*t37-I_Bxz.*I_Byy.*t37),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-G_g3.*t6.*t7-G_g2.*t3.*t7.*t8-G_g1.*t5.*t7.*t8,G_g3.*t4.*t6+G_g2.*t3.*t4.*t8+G_g1.*t4.*t5.*t8,-G_g3.*t8+G_g2.*t3.*t6+G_g1.*t5.*t6,-t26.*(I_Bxy.*I_Bzz.*t38-I_Bxz.*I_Byz.*t38),-t26.*(t21.*t38-I_Bxx.*I_Bzz.*t38),-t26.*(I_Bxx.*I_Byz.*t38-I_Bxy.*I_Bxz.*t38),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t6.*t64.*t67.*t68,0.0,t60.*t64.*(omega_By.*t4.*t8+omega_Bx.*t7.*t8+omega_Bz.*t6.*t61+omega_Bz.*t6.*t62)+t6.*t64.*t68.*(omega_By.*t4.*t6+omega_Bx.*t6.*t7-omega_Bz.*t8.*t61-omega_Bz.*t8.*t62),0.0,0.0,0.0,0.0,0.0,0.0,G_g2.*t10-G_g1.*t13+G_g3.*t4.*t8,G_g1.*t15-G_g2.*t18+G_g3.*t7.*t8,0.0,t26.*(I_Bxy.*I_Byz.*t39-I_Bxz.*I_Byy.*t39),-t26.*(I_Bxx.*I_Byz.*t39-I_Bxy.*I_Bxz.*t39),-t26.*(t20.*t39-I_Bxx.*I_Byy.*t39),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t60.*t64.*(omega_Bx.*t4-omega_By.*t7),-t64.*t67,t60.*t64.*(omega_Bx.*t4.*t6-omega_By.*t6.*t7),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t26.*(k_xx.*phi01.*t19.*2.0-k_xx.*phi1.*t19.*2.0-I_Byy.*I_Bzz.*k_xx.*phi01.*2.0+I_Byy.*I_Bzz.*k_xx.*phi1.*2.0),t26.*(I_Bxy.*I_Bzz.*k_xx.*phi01.*2.0-I_Bxy.*I_Bzz.*k_xx.*phi1.*2.0-I_Bxz.*I_Byz.*k_xx.*phi01.*2.0+I_Bxz.*I_Byz.*k_xx.*phi1.*2.0),-t26.*(I_Bxy.*I_Byz.*k_xx.*phi01.*2.0-I_Bxy.*I_Byz.*k_xx.*phi1.*2.0-I_Bxz.*I_Byy.*k_xx.*phi01.*2.0+I_Bxz.*I_Byy.*k_xx.*phi1.*2.0),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t26.*(I_Bxy.*I_Bzz.*k_yy.*phi02.*2.0-I_Bxy.*I_Bzz.*k_yy.*phi2.*2.0-I_Bxz.*I_Byz.*k_yy.*phi02.*2.0+I_Bxz.*I_Byz.*k_yy.*phi2.*2.0),t26.*(k_yy.*phi02.*t21.*2.0-k_yy.*phi2.*t21.*2.0-I_Bxx.*I_Bzz.*k_yy.*phi02.*2.0+I_Bxx.*I_Bzz.*k_yy.*phi2.*2.0),t26.*(I_Bxx.*I_Byz.*k_yy.*phi02.*2.0-I_Bxx.*I_Byz.*k_yy.*phi2.*2.0-I_Bxy.*I_Bxz.*k_yy.*phi02.*2.0+I_Bxy.*I_Bxz.*k_yy.*phi2.*2.0),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t26.*(I_Bxy.*I_Byz.*k_zz.*phi03.*2.0-I_Bxy.*I_Byz.*k_zz.*phi3.*2.0-I_Bxz.*I_Byy.*k_zz.*phi03.*2.0+I_Bxz.*I_Byy.*k_zz.*phi3.*2.0),t26.*(I_Bxx.*I_Byz.*k_zz.*phi03.*2.0-I_Bxx.*I_Byz.*k_zz.*phi3.*2.0-I_Bxy.*I_Bxz.*k_zz.*phi03.*2.0+I_Bxy.*I_Bxz.*k_zz.*phi3.*2.0),t26.*(k_zz.*phi03.*t20.*2.0-k_zz.*phi3.*t20.*2.0-I_Bxx.*I_Byy.*k_zz.*phi03.*2.0+I_Bxx.*I_Byy.*k_zz.*phi3.*2.0),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t26.*(omega_Bx.*t19-I_Byy.*I_Bzz.*omega_Bx),-t26.*(I_Bxy.*I_Bzz.*omega_Bx-I_Bxz.*I_Byz.*omega_Bx),t26.*(I_Bxy.*I_Byz.*omega_Bx-I_Bxz.*I_Byy.*omega_Bx),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t26.*(I_Bxy.*I_Bzz.*omega_By-I_Bxz.*I_Byz.*omega_By),-t26.*(omega_By.*t21-I_Bxx.*I_Bzz.*omega_By),-t26.*(I_Bxx.*I_Byz.*omega_By-I_Bxy.*I_Bxz.*omega_By),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t26.*(I_Bxy.*I_Byz.*omega_Bz-I_Bxz.*I_Byy.*omega_Bz),-t26.*(I_Bxx.*I_Byz.*omega_Bz-I_Bxy.*I_Bxz.*omega_Bz),-t26.*(omega_Bz.*t20-I_Bxx.*I_Byy.*omega_Bz),0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],[27, 27]);