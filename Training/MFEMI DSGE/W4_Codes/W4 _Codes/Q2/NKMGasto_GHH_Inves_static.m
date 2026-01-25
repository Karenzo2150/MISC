function [residual, g1, g2, g3] = NKMGasto_GHH_Inves_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 15, 1);

%
% Model equations
%

cr1__ = exp(y(7))/(exp(y(7))^params(8)*params(10)^(1-params(8)));
cr2__ = exp(y(7))/(exp(y(7))^params(8)*params(10)^(1-params(8)));
sinv__ = 0;
dsinv__ = 0;
dsinvP__ = 0;
T34 = exp(y(2))-params(3)/(1+params(2))*exp(y(3))^(1+params(2));
T44 = exp(y(1))*params(4)*exp(y(6))/exp(y(7));
T122 = exp(y(5))*(1-exp(y(8)))-exp(y(5))*params(7)/2*(cr1__-1)^2;
T127 = exp(y(15))*exp(y(3))^(1-params(15));
T128 = exp(y(11))^params(15);
lhs =exp(y(1));
rhs =T34^(-params(1));
residual(1)= lhs-rhs;
lhs =exp(y(1));
rhs =T44;
residual(2)= lhs-rhs;
lhs =params(3)*exp(y(3))^params(2);
rhs =exp(y(4));
residual(3)= lhs-rhs;
lhs =exp(y(11));
rhs =exp(y(11))*(1-params(16))+exp(y(10))*(1-sinv__);
residual(4)= lhs-rhs;
lhs =exp(y(12));
rhs =params(4)*(exp(y(13))+(1-params(16))*exp(y(12)));
residual(5)= lhs-rhs;
lhs =1;
rhs =exp(y(12))*(1-sinv__-exp(y(10))*dsinv__)-params(4)*exp(y(10))*exp(y(12))*dsinvP__;
residual(6)= lhs-rhs;
lhs =exp(y(4));
rhs =(1-params(15))*exp(y(8))*exp(y(5))/exp(y(3));
residual(7)= lhs-rhs;
lhs =exp(y(13));
rhs =exp(y(5))*params(15)*exp(y(8))/exp(y(11));
residual(8)= lhs-rhs;
lhs =0;
rhs =1-params(9)+exp(y(8))*params(9)-cr1__*exp(y(7))*params(7)*(cr1__-1)+exp(y(5))*exp(y(7))*cr2__*params(4)*params(7)*(cr2__-1)/exp(y(5));
residual(9)= lhs-rhs;
lhs =exp(y(9));
rhs =T122;
residual(10)= lhs-rhs;
lhs =exp(y(5));
rhs =T127*T128;
residual(11)= lhs-rhs;
lhs =exp(y(10))+exp(y(2))+exp(y(14));
rhs =exp(y(9))+exp(y(3))*exp(y(4))+exp(y(11))*exp(y(13));
residual(12)= lhs-rhs;
lhs =exp(y(6));
rhs =params(11)*(exp(y(7))/params(10))^params(12)*exp(x(2));
residual(13)= lhs-rhs;
lhs =y(14);
rhs =y(14)*params(6)+(1-params(6))*log(params(5))+x(1);
residual(14)= lhs-rhs;
lhs =y(15);
rhs =(1-params(13))*log(params(27))+y(15)*params(13)+x(3);
residual(15)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(15, 15);

  %
  % Jacobian matrix
  %

T14 = params(10)^(1-params(8));
T15 = exp(y(7))^params(8)*T14;
T170 = getPowerDeriv(T34,(-params(1)),1);
T194 = (-((1-params(15))*exp(y(8))*exp(y(5))/exp(y(3))));
T213 = (exp(y(7))*T15-exp(y(7))*T14*exp(y(7))*getPowerDeriv(exp(y(7)),params(8),1))/(T15*T15);
  g1(1,1)=exp(y(1));
  g1(1,2)=(-(exp(y(2))*T170));
  g1(1,3)=(-(T170*(-(params(3)/(1+params(2))*exp(y(3))*getPowerDeriv(exp(y(3)),1+params(2),1)))));
  g1(2,1)=exp(y(1))-T44;
  g1(2,6)=(-T44);
  g1(2,7)=(-(exp(y(1))*params(4)*(-(exp(y(7))*exp(y(6))))/(exp(y(7))*exp(y(7)))));
  g1(3,3)=params(3)*exp(y(3))*getPowerDeriv(exp(y(3)),params(2),1);
  g1(3,4)=(-exp(y(4)));
  g1(4,10)=(-(exp(y(10))*(1-sinv__)));
  g1(4,11)=exp(y(11))-exp(y(11))*(1-params(16));
  g1(5,12)=exp(y(12))-params(4)*(1-params(16))*exp(y(12));
  g1(5,13)=(-(params(4)*exp(y(13))));
  g1(6,10)=(-(exp(y(12))*(-(exp(y(10))*dsinv__))-params(4)*exp(y(10))*exp(y(12))*dsinvP__));
  g1(6,12)=(-(exp(y(12))*(1-sinv__-exp(y(10))*dsinv__)-params(4)*exp(y(10))*exp(y(12))*dsinvP__));
  g1(7,3)=(-((-(exp(y(3))*(1-params(15))*exp(y(8))*exp(y(5))))/(exp(y(3))*exp(y(3)))));
  g1(7,4)=exp(y(4));
  g1(7,5)=T194;
  g1(7,8)=T194;
  g1(8,5)=(-(exp(y(5))*params(15)*exp(y(8))/exp(y(11))));
  g1(8,8)=(-(exp(y(5))*params(15)*exp(y(8))/exp(y(11))));
  g1(8,11)=(-((-(exp(y(11))*exp(y(5))*params(15)*exp(y(8))))/(exp(y(11))*exp(y(11)))));
  g1(8,13)=exp(y(13));
  g1(9,7)=(-((-(exp(y(7))*params(7)*(cr1__-1)*T213+cr1__*(exp(y(7))*params(7)*(cr1__-1)+exp(y(7))*params(7)*T213)))+exp(y(5))*(exp(y(7))*cr2__*params(4)*params(7)*(cr2__-1)+exp(y(7))*(params(4)*params(7)*(cr2__-1)*T213+cr2__*params(4)*params(7)*T213))/exp(y(5))));
  g1(9,8)=(-(exp(y(8))*params(9)));
  g1(10,5)=(-T122);
  g1(10,7)=exp(y(5))*params(7)/2*T213*2*(cr1__-1);
  g1(10,8)=(-(exp(y(5))*(-exp(y(8)))));
  g1(10,9)=exp(y(9));
  g1(11,3)=(-(T128*exp(y(15))*exp(y(3))*getPowerDeriv(exp(y(3)),1-params(15),1)));
  g1(11,5)=exp(y(5));
  g1(11,11)=(-(T127*exp(y(11))*getPowerDeriv(exp(y(11)),params(15),1)));
  g1(11,15)=(-(T127*T128));
  g1(12,2)=exp(y(2));
  g1(12,3)=(-(exp(y(3))*exp(y(4))));
  g1(12,4)=(-(exp(y(3))*exp(y(4))));
  g1(12,9)=(-exp(y(9)));
  g1(12,10)=exp(y(10));
  g1(12,11)=(-(exp(y(11))*exp(y(13))));
  g1(12,13)=(-(exp(y(11))*exp(y(13))));
  g1(12,14)=exp(y(14));
  g1(13,6)=exp(y(6));
  g1(13,7)=(-(exp(x(2))*params(11)*exp(y(7))/params(10)*getPowerDeriv(exp(y(7))/params(10),params(12),1)));
  g1(14,14)=1-params(6);
  g1(15,15)=1-params(13);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],15,225);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],15,3375);
end
end
end
end
