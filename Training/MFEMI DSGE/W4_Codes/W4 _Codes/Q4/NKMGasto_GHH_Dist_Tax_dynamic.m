function [residual, g1, g2, g3] = NKMGasto_GHH_Dist_Tax_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(23, 1);
cr1__ = exp(y(18))/(exp(y(2))^params(8)*params(10)^(1-params(8)));
cr2__ = exp(y(37))/(params(10)^(1-params(8))*exp(y(18))^params(8));
sinv__ = 0.5*params(14)*(exp(y(21))/exp(y(3))-1)^2;
dsinv__ = exp(y(21))/exp(y(3))*params(14)*(exp(y(21))/exp(y(3))-1);
dsinvP__ = params(14)*(exp(y(38))/exp(y(21))-1)*(exp(y(38))/exp(y(21)))^2;
T59 = exp(y(13))-params(3)/(1+params(2))*exp(y(14))^(1+params(2));
T97 = params(4)*exp(y(35))/exp(y(12));
T110 = (1-y(41))*exp(y(40))+params(16)*y(41)*exp(y(23))/exp(y(37))+(1-params(16))*exp(y(39));
T159 = exp(y(37))*cr2__*T97*params(7)*(cr2__-1)*exp(y(36))/exp(y(16));
T167 = exp(y(16))*params(7)/2;
T170 = exp(y(16))*(1-exp(y(19)))-T167*(cr1__-1)^2;
T175 = exp(y(26))*exp(y(14))^(1-params(15));
T176 = exp(y(4))^params(15);
T195 = params(11)*(exp(y(18))/params(10))^params(12)*exp(x(it_, 2));
T217 = exp(y(4))*y(30)*(exp(y(24))-params(16)*exp(y(5))/exp(y(18)));
lhs =(1+y(32))*exp(y(12));
rhs =T59^(-params(1));
residual(1)= lhs-rhs;
lhs =exp(y(12));
rhs =params(4)*exp(y(35))*exp(y(17))/exp(y(37));
residual(2)= lhs-rhs;
lhs =params(3)*exp(y(14))^params(2);
rhs =(1-y(31))/(1+y(32))*exp(y(15));
residual(3)= lhs-rhs;
lhs =exp(y(22));
rhs =(1-params(16))*exp(y(4))+exp(y(21))*(1-sinv__);
residual(4)= lhs-rhs;
lhs =exp(y(23));
rhs =T97*T110;
residual(5)= lhs-rhs;
lhs =1;
rhs =exp(y(23))*(1-sinv__-exp(y(21))*dsinv__)-T97*exp(y(38))*exp(y(39))*dsinvP__;
residual(6)= lhs-rhs;
lhs =exp(y(15));
rhs =(1-params(15))*exp(y(19))*exp(y(16))/exp(y(14));
residual(7)= lhs-rhs;
lhs =exp(y(24));
rhs =exp(y(16))*params(15)*exp(y(19))/exp(y(4));
residual(8)= lhs-rhs;
lhs =0;
rhs =1-params(9)+exp(y(19))*params(9)-cr1__*exp(y(18))*params(7)*(cr1__-1)+T159;
residual(9)= lhs-rhs;
lhs =exp(y(20));
rhs =T170;
residual(10)= lhs-rhs;
lhs =exp(y(16));
rhs =T175*T176;
residual(11)= lhs-rhs;
lhs =exp(y(21))+exp(y(13))+exp(y(25));
rhs =exp(y(20))+exp(y(14))*exp(y(15))+exp(y(4))*exp(y(24));
residual(12)= lhs-rhs;
lhs =exp(y(17));
rhs =T195;
residual(13)= lhs-rhs;
lhs =y(25);
rhs =params(6)*y(6)+(1-params(6))*log(params(5))+x(it_, 1);
residual(14)= lhs-rhs;
lhs =exp(y(27));
rhs =T217;
residual(15)= lhs-rhs;
lhs =exp(y(28));
rhs =exp(y(14))*y(31)*exp(y(15));
residual(16)= lhs-rhs;
lhs =exp(y(29));
rhs =y(32)*exp(y(13));
residual(17)= lhs-rhs;
lhs =y(31);
rhs =(1-params(17))*params(34)+params(17)*y(9)+x(it_, 4);
residual(18)= lhs-rhs;
lhs =y(30);
rhs =(1-params(18))*params(32)+params(18)*y(8)+x(it_, 5);
residual(19)= lhs-rhs;
lhs =y(32);
rhs =(1-params(19))*params(33)+params(19)*y(10)+x(it_, 6);
residual(20)= lhs-rhs;
lhs =y(34);
rhs =params(35);
residual(21)= lhs-rhs;
lhs =y(34)+exp(y(29))+exp(y(27))+exp(y(28));
rhs =exp(y(25))+exp(y(1))/exp(y(18))*y(11)+y(33);
residual(22)= lhs-rhs;
lhs =y(26);
rhs =(1-params(13))*log(params(31))+params(13)*y(7)+x(it_, 3);
residual(23)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(23, 47);

  %
  % Jacobian matrix
  %

T16 = params(10)^(1-params(8));
T17 = exp(y(2))^params(8)*T16;
T22 = T16*exp(y(18))^params(8);
T31 = exp(y(21))/exp(y(3));
T39 = exp(y(38))/exp(y(21));
T42 = T39^2;
T288 = params(4)*(-(exp(y(12))*exp(y(35))))/(exp(y(12))*exp(y(12)));
T304 = getPowerDeriv(T59,(-params(1)),1);
T330 = (-((1-params(15))*exp(y(19))*exp(y(16))/exp(y(14))));
T345 = (-(exp(y(18))*T16*exp(y(2))*getPowerDeriv(exp(y(2)),params(8),1)))/(T17*T17);
T367 = (-(exp(y(37))*T16*exp(y(18))*getPowerDeriv(exp(y(18)),params(8),1)))/(T22*T22);
T427 = (-(exp(y(21))*exp(y(3))))/(exp(y(3))*exp(y(3)));
T431 = (-(0.5*params(14)*T427*2*(T31-1)));
T458 = (-(exp(y(21))*exp(y(38))))/(exp(y(21))*exp(y(21)));
  g1(1,12)=(1+y(32))*exp(y(12));
  g1(1,13)=(-(exp(y(13))*T304));
  g1(1,14)=(-(T304*(-(params(3)/(1+params(2))*exp(y(14))*getPowerDeriv(exp(y(14)),1+params(2),1)))));
  g1(1,32)=exp(y(12));
  g1(2,12)=exp(y(12));
  g1(2,35)=(-(params(4)*exp(y(35))*exp(y(17))/exp(y(37))));
  g1(2,17)=(-(params(4)*exp(y(35))*exp(y(17))/exp(y(37))));
  g1(2,37)=(-(params(4)*exp(y(35))*(-(exp(y(37))*exp(y(17))))/(exp(y(37))*exp(y(37)))));
  g1(3,14)=params(3)*exp(y(14))*getPowerDeriv(exp(y(14)),params(2),1);
  g1(3,15)=(-((1-y(31))/(1+y(32))*exp(y(15))));
  g1(3,31)=(-(exp(y(15))*(-1)/(1+y(32))));
  g1(3,32)=(-(exp(y(15))*(-(1-y(31)))/((1+y(32))*(1+y(32)))));
  g1(4,3)=(-(exp(y(21))*T431));
  g1(4,21)=(-(exp(y(21))*(1-sinv__)+exp(y(21))*(-(0.5*params(14)*T31*2*(T31-1)))));
  g1(4,4)=(-((1-params(16))*exp(y(4))));
  g1(4,22)=exp(y(22));
  g1(5,12)=(-(T110*T288));
  g1(5,35)=(-(T97*T110));
  g1(5,37)=(-(T97*params(16)*y(41)*(-(exp(y(37))*exp(y(23))))/(exp(y(37))*exp(y(37)))));
  g1(5,23)=exp(y(23))-T97*params(16)*y(41)*exp(y(23))/exp(y(37));
  g1(5,39)=(-(T97*(1-params(16))*exp(y(39))));
  g1(5,40)=(-(T97*(1-y(41))*exp(y(40))));
  g1(5,41)=(-(T97*((-exp(y(40)))+params(16)*exp(y(23))/exp(y(37)))));
  g1(6,12)=exp(y(38))*exp(y(39))*dsinvP__*T288;
  g1(6,35)=T97*exp(y(38))*exp(y(39))*dsinvP__;
  g1(6,3)=(-(exp(y(23))*(T431-exp(y(21))*(params(14)*(T31-1)*T427+T31*params(14)*T427))));
  g1(6,21)=(-(exp(y(23))*((-(0.5*params(14)*T31*2*(T31-1)))-(exp(y(21))*dsinv__+exp(y(21))*(T31*params(14)*(T31-1)+T31*params(14)*T31)))-T97*exp(y(38))*exp(y(39))*(T42*params(14)*T458+params(14)*(T39-1)*T458*2*T39)));
  g1(6,38)=T97*(exp(y(38))*exp(y(39))*dsinvP__+exp(y(38))*exp(y(39))*(T42*params(14)*T39+params(14)*(T39-1)*T39*2*T39));
  g1(6,23)=(-(exp(y(23))*(1-sinv__-exp(y(21))*dsinv__)));
  g1(6,39)=T97*exp(y(38))*exp(y(39))*dsinvP__;
  g1(7,14)=(-((-(exp(y(14))*(1-params(15))*exp(y(19))*exp(y(16))))/(exp(y(14))*exp(y(14)))));
  g1(7,15)=exp(y(15));
  g1(7,16)=T330;
  g1(7,19)=T330;
  g1(8,16)=(-(exp(y(16))*params(15)*exp(y(19))/exp(y(4))));
  g1(8,19)=(-(exp(y(16))*params(15)*exp(y(19))/exp(y(4))));
  g1(8,4)=(-((-(exp(y(4))*exp(y(16))*params(15)*exp(y(19))))/(exp(y(4))*exp(y(4)))));
  g1(8,24)=exp(y(24));
  g1(9,12)=(-(exp(y(36))*exp(y(37))*cr2__*(cr2__-1)*params(7)*T288/exp(y(16))));
  g1(9,35)=(-T159);
  g1(9,16)=(-((-(exp(y(16))*exp(y(37))*cr2__*T97*params(7)*(cr2__-1)*exp(y(36))))/(exp(y(16))*exp(y(16)))));
  g1(9,36)=(-T159);
  g1(9,2)=exp(y(18))*params(7)*(cr1__-1)*T345+cr1__*exp(y(18))*params(7)*T345;
  g1(9,18)=(-((-(exp(y(18))/T17*exp(y(18))*params(7)*(cr1__-1)+cr1__*(exp(y(18))*params(7)*(cr1__-1)+exp(y(18))/T17*exp(y(18))*params(7))))+exp(y(36))*exp(y(37))*(T97*params(7)*(cr2__-1)*T367+cr2__*T97*params(7)*T367)/exp(y(16))));
  g1(9,37)=(-(exp(y(36))*(exp(y(37))*cr2__*T97*params(7)*(cr2__-1)+exp(y(37))*(exp(y(37))/T22*T97*params(7)*(cr2__-1)+cr2__*exp(y(37))/T22*T97*params(7)))/exp(y(16))));
  g1(9,19)=(-(exp(y(19))*params(9)));
  g1(10,16)=(-T170);
  g1(10,2)=T167*T345*2*(cr1__-1);
  g1(10,18)=T167*exp(y(18))/T17*2*(cr1__-1);
  g1(10,19)=(-(exp(y(16))*(-exp(y(19)))));
  g1(10,20)=exp(y(20));
  g1(11,14)=(-(T176*exp(y(26))*exp(y(14))*getPowerDeriv(exp(y(14)),1-params(15),1)));
  g1(11,16)=exp(y(16));
  g1(11,4)=(-(T175*exp(y(4))*getPowerDeriv(exp(y(4)),params(15),1)));
  g1(11,26)=(-(T175*T176));
  g1(12,13)=exp(y(13));
  g1(12,14)=(-(exp(y(14))*exp(y(15))));
  g1(12,15)=(-(exp(y(14))*exp(y(15))));
  g1(12,20)=(-exp(y(20)));
  g1(12,21)=exp(y(21));
  g1(12,4)=(-(exp(y(4))*exp(y(24))));
  g1(12,24)=(-(exp(y(4))*exp(y(24))));
  g1(12,25)=exp(y(25));
  g1(13,17)=exp(y(17));
  g1(13,18)=(-(exp(x(it_, 2))*params(11)*exp(y(18))/params(10)*getPowerDeriv(exp(y(18))/params(10),params(12),1)));
  g1(13,43)=(-T195);
  g1(14,6)=(-params(6));
  g1(14,25)=1;
  g1(14,42)=(-1);
  g1(15,18)=(-(exp(y(4))*y(30)*(-((-(exp(y(18))*params(16)*exp(y(5))))/(exp(y(18))*exp(y(18)))))));
  g1(15,4)=(-T217);
  g1(15,5)=(-(exp(y(4))*y(30)*(-(params(16)*exp(y(5))/exp(y(18))))));
  g1(15,24)=(-(exp(y(4))*exp(y(24))*y(30)));
  g1(15,27)=exp(y(27));
  g1(15,30)=(-(exp(y(4))*(exp(y(24))-params(16)*exp(y(5))/exp(y(18)))));
  g1(16,14)=(-(exp(y(14))*y(31)*exp(y(15))));
  g1(16,15)=(-(exp(y(14))*y(31)*exp(y(15))));
  g1(16,28)=exp(y(28));
  g1(16,31)=(-(exp(y(14))*exp(y(15))));
  g1(17,13)=(-(y(32)*exp(y(13))));
  g1(17,29)=exp(y(29));
  g1(17,32)=(-exp(y(13)));
  g1(18,9)=(-params(17));
  g1(18,31)=1;
  g1(18,45)=(-1);
  g1(19,8)=(-params(18));
  g1(19,30)=1;
  g1(19,46)=(-1);
  g1(20,10)=(-params(19));
  g1(20,32)=1;
  g1(20,47)=(-1);
  g1(21,34)=1;
  g1(22,1)=(-(exp(y(1))/exp(y(18))*y(11)));
  g1(22,18)=(-(y(11)*(-(exp(y(18))*exp(y(1))))/(exp(y(18))*exp(y(18)))));
  g1(22,25)=(-exp(y(25)));
  g1(22,27)=exp(y(27));
  g1(22,28)=exp(y(28));
  g1(22,29)=exp(y(29));
  g1(22,33)=(-1);
  g1(22,11)=(-(exp(y(1))/exp(y(18))));
  g1(22,34)=1;
  g1(23,7)=(-params(13));
  g1(23,26)=1;
  g1(23,44)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],23,2209);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],23,103823);
end
end
end
end
