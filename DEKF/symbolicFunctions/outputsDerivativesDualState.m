function dh_dX = outputsDerivativesDualState(x,v,F,m,k1,k2,c)
%OUTPUTSDERIVATIVESDUALSTATE
%    DH_DX = OUTPUTSDERIVATIVESDUALSTATE(X,V,F,M,K1,K2,C)

%    This function was generated by the Symbolic Math Toolbox version 6.2.
%    31-Jul-2015 04:00:34

dh_dX = reshape([0.0,0.0,1.0,0.0,0.0,1.0],[2, 3]);
