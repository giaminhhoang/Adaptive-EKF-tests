function dh_dX = outputsDerivatives(x,v,F,m,k1,k2,c)
%OUTPUTSDERIVATIVES
%    DH_DX = OUTPUTSDERIVATIVES(X,V,F,M,K1,K2,C)

%    This function was generated by the Symbolic Math Toolbox version 6.2.
%    30-Jul-2015 17:04:09

dh_dX = reshape([0.0,0.0,1.0,0.0,0.0,1.0],[2, 3]);