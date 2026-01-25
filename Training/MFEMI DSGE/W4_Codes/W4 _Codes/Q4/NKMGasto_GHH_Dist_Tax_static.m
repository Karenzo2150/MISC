function [residual, g1, g2, g3] = NKMGasto_GHH_Dist_Tax_static(y, x, params)
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

residual = zeros( 23, 1);

%
% Model equations
%

cr1__ = exp(y(7))/(exp(y(7))^params(8)*params(10)^(1-params(8)));
cr2__ = exp(y(7))/(exp(y(7))^params(8)*params(10)^(1-params(8)));
sinv__ = 0;
dsinv__ = 0;
dsinvP__ = 0;
T37 = exp(y(2))-params(3)/(1+params(2))*exp(y(3))^(1+params(2));
T46 = exp(y(6))/exp(y(7));
T47 = exp(y(1))*params(4)*T46;
T136 = exp(y(5))*(1-exp(y(8)))-exp(y(5))*params(7)/2*(cr1__-1)^2;
T141 = exp(y(15))*exp(y(3))^(1-params(15));
T142 = exp(y(11))^params(15);
T179 = exp(y(11))*y(19)*(exp(y(13))-params(16)*exp(y(12))/exp(y(7)));
lhs =(1+y(21))*exp(y(1));
rhs =T37^(-params(1));
residual(1)= lhs-rhs;
lhs =exp(y(1));
rhs =T47;
residual(2)= lhs-rhs;
lhs =params(3)*exp(y(3))^params(2);
rhs =(1-y(20))/(1+y(21))*exp(y(4));
residual(3)= lhs-rhs;
lhs =exp(y(11));
rhs =exp(y(11))*(1-params(16))+exp(y(10))*(1-sinv__);
residual(4)= lhs-rhs;
lhs =exp(y(12));
rhs =params(4)*((1-y(19))*exp(y(13))+params(16)*y(19)*exp(y(12))/exp(y(7))+(1-params(16))*exp(y(12)));
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
rhs =T136;
residual(10)= lhs-rhs;
lhs =exp(y(5));
rhs =T141*T142;
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
lhs =exp(y(16));
rhs =T179;
residual(15)= lhs-rhs;
lhs =exp(y(17));
rhs =exp(y(3))*y(20)*exp(y(4));
residual(16)= lhs-rhs;
lhs =exp(y(18));
rhs =y(21)*exp(y(2));
residual(17)= lhs-rhs;
lhs =y(20);
rhs =(1-params(17))*params(34)+y(20)*params(17)+x(4);
residual(18)= lhs-rhs;
lhs =y(19);
rhs =(1-params(18))*params(32)+y(19)*params(18)+x(5);
residual(19)= lhs-rhs;
lhs =y(21);
rhs =(1-params(19))*params(33)+y(21)*params(19)+x(6);
residual(20)= lhs-rhs;
lhs =y(23);
rhs =params(35);
residual(21)= lhs-rhs;
lhs =y(23)+exp(y(18))+exp(y(16))+exp(y(17));
rhs =exp(y(14))+T46*y(23)+y(22);
residual(22)= lhs-rhs;
lhs =y(15);
rhs =(1-params(13))*log(params(31))+y(15)*params(13)+x(3);
residual(23)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(23, 23);

  %
  % Jacobian matrix
  %

T14 = params(10)^(1-params(8));
T15 = exp(y(7))^params(8)*T14;
T239 = getPowerDeriv(T37,(-params(1)),1);
T265 = (-((1-params(15))*exp(y(8))*exp(y(5))/exp(y(3))));
T275 = (-(exp(y(7))*exp(y(6))))/(exp(y(7))*exp(y(7)));
T291 = (exp(y(7))*T15-exp(y(7))*T14*exp(y(7))*getPowerDeriv(exp(y(7)),params(8),1))/(T15*T15);
  g1(1,1)=(1+y(21))*exp(y(1));
  g1(1,2)=(-(exp(y(2))*T239));
  g1(1,3)=(-(T239*(-(params(3)/(1+params(2))*exp(y(3))*getPowerDeriv(exp(y(3)),1+params(2),1)))));
  g1(1,21)=exp(y(1));
  g1(2,1)=exp(y(1))-T47;
  g1(2,6)=(-T47);
  g1(2,7)=(-(exp(y(1))*params(4)*T275));
  g1(3,3)=params(3)*exp(y(3))*getPowerDeriv(exp(y(3)),params(2),1);
  g1(3,4)=(-((1-y(20))/(1+y(21))*exp(y(4))));
  g1(3,20)=(-(exp(y(4))*(-1)/(1+y(21))));
  g1(3,21)=(-(exp(y(4))*(-(1-y(20)))/((1+y(21))*(1+y(21)))));
  g1(4,10)=(-(exp(y(10))*(1-sinv__)));
  g1(4,11)=exp(y(11))-exp(y(11))*(1-params(16));
  g1(5,7)=(-(params(4)*params(16)*y(19)*(-(exp(y(7))*exp(y(12))))/(exp(y(7))*exp(y(7)))));
  g1(5,12)=exp(y(12))-params(4)*(params(16)*y(19)*exp(y(12))/exp(y(7))+(1-params(16))*exp(y(12)));
  g1(5,13)=(-(params(4)*(1-y(19))*exp(y(13))));
  g1(5,19)=(-(params(4)*((-exp(y(13)))+params(16)*exp(y(12))/exp(y(7)))));
  g1(6,10)=(-(exp(y(12))*(-(exp(y(10))*dsinv__))-params(4)*exp(y(10))*exp(y(12))*dsinvP__));
  g1(6,12)=(-(exp(y(12))*(1-sinv__-exp(y(10))*dsinv__)-params(4)*exp(y(10))*exp(y(12))*dsinvP__));
  g1(7,3)=(-((-(exp(y(3))*(1-params(15))*exp(y(8))*exp(y(5))))/(exp(y(3))*exp(y(3)))));
  g1(7,4)=exp(y(4));
  g1(7,5)=T265;
  g1(7,8)=T265;
  g1(8,5)=(-(exp(y(5))*params(15)*exp(y(8))/exp(y(11))));
  g1(8,8)=(-(exp(y(5))*params(15)*exp(y(8))/exp(y(11))));
  g1(8,11)=(-((-(exp(y(11))*exp(y(5))*params(15)*exp(y(8))))/(exp(y(11))*exp(y(11)))));
  g1(8,13)=exp(y(13));
  g1(9,7)=(-((-(exp(y(7))*params(7)*(cr1__-1)*T291+cr1__*(exp(y(7))*params(7)*(cr1__-1)+exp(y(7))*params(7)*T291)))+exp(y(5))*(exp(y(7))*cr2__*params(4)*params(7)*(cr2__-1)+exp(y(7))*(params(4)*params(7)*(cr2__-1)*T291+cr2__*params(4)*params(7)*T291))/exp(y(5))));
  g1(9,8)=(-(exp(y(8))*params(9)));
  g1(10,5)=(-T136);
  g1(10,7)=exp(y(5))*params(7)/2*T291*2*(cr1__-1);
  g1(10,8)=(-(exp(y(5))*(-exp(y(8)))));
  g1(10,9)=exp(y(9));
  g1(11,3)=(-(T142*exp(y(15))*exp(y(3))*getPowerDeriv(exp(y(3)),1-params(15),1)));
  g1(11,5)=exp(y(5));
  g1(11,11)=(-(T141*exp(y(11))*getPowerDeriv(exp(y(11)),params(15),1)));
  g1(11,15)=(-(T141*T142));
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
  g1(15,7)=(-(exp(y(11))*y(19)*(-((-(exp(y(7))*params(16)*exp(y(12))))/(exp(y(7))*exp(y(7)))))));
  g1(15,11)=(-T179);
  g1(15,12)=(-(exp(y(11))*y(19)*(-(params(16)*exp(y(12))/exp(y(7))))));
  g1(15,13)=(-(exp(y(11))*y(19)*exp(y(13))));
  g1(15,16)=exp(y(16));
  g1(15,19)=(-(exp(y(11))*(exp(y(13))-params(16)*exp(y(12))/exp(y(7)))));
  g1(16,3)=(-(exp(y(3))*y(20)*exp(y(4))));
  g1(16,4)=(-(exp(y(3))*y(20)*exp(y(4))));
  g1(16,17)=exp(y(17));
  g1(16,20)=(-(exp(y(3))*exp(y(4))));
  g1(17,2)=(-(y(21)*exp(y(2))));
  g1(17,18)=exp(y(18));
  g1(17,21)=(-exp(y(2)));
  g1(18,20)=1-params(17);
  g1(19,19)=1-params(18);
  g1(20,21)=1-params(19);
  g1(21,23)=1;
  g1(22,6)=(-(T46*y(23)));
  g1(22,7)=(-(y(23)*T275));
  g1(22,14)=(-exp(y(14)));
  g1(22,16)=exp(y(16));
  g1(22,17)=exp(y(17));
  g1(22,18)=exp(y(18));
  g1(22,22)=(-1);
  g1(22,23)=1-T46;
  g1(23,15)=1-params(13);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],23,529);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],23,12167);
end
end
end
end
