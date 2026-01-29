function [residual, g1, g2, g3] = GLS_compLabor_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(26, 1);
cr1__ = exp(y(12))/params(8);
cr2__ = exp(y(36))/params(8);
sinv__ = 0.5*params(2)*(exp(y(16))/exp(y(3))-1)^2;
dsinv__ = exp(y(16))/exp(y(3))*params(2)*(exp(y(16))/exp(y(3))-1);
dsinvP__ = params(2)*(exp(y(39))/exp(y(16))-1)*(exp(y(39))/exp(y(16)))^2;
T11 = exp(y(12))/params(8);
T53 = params(1)*exp(y(35))/exp(y(10));
T148 = exp(y(36))*cr2__*T53*params(7)*(cr2__-1)*exp(y(40))/exp(y(22));
T154 = exp(y(1))^params(10);
T158 = params(15)*T11^params(9);
T160 = T158^(1-params(10));
T189 = exp(y(32))*exp(y(4))^params(6);
T190 = exp(y(25))^(1-params(6));
T225 = params(7)*0.5*exp(y(22))*(cr1__-1)^2;
lhs =1/exp(y(9));
rhs =exp(y(10));
residual(1)= lhs-rhs;
lhs =exp(y(10));
rhs =exp(y(35))*params(1)*exp(y(11))/exp(y(36));
residual(2)= lhs-rhs;
lhs =exp(y(14));
rhs =T53*(exp(y(37))+exp(y(38))*(1-params(3)));
residual(3)= lhs-rhs;
lhs =1;
rhs =exp(y(14))*(1-sinv__-dsinv__)+T53*exp(y(38))*dsinvP__;
residual(4)= lhs-rhs;
lhs =exp(y(15));
rhs =(1-params(3))*exp(y(2))+exp(y(16))*(1-sinv__);
residual(5)= lhs-rhs;
lhs =params(5)*exp(y(18))^params(4);
rhs =exp(y(10))*exp(y(17));
residual(6)= lhs-rhs;
lhs =params(5)*exp(y(19))^params(4);
rhs =exp(y(17))*exp(y(23));
residual(7)= lhs-rhs;
lhs =1/exp(y(20));
rhs =exp(y(23));
residual(8)= lhs-rhs;
lhs =exp(y(20));
rhs =exp(y(17))*exp(y(19))-y(29);
residual(9)= lhs-rhs;
lhs =exp(y(17));
rhs =(1-params(6))*exp(y(21))*exp(y(22))/exp(y(25));
residual(10)= lhs-rhs;
lhs =exp(y(13));
rhs =exp(y(22))*params(6)*exp(y(21))/exp(y(4));
residual(11)= lhs-rhs;
lhs =0;
rhs =1-params(16)+exp(y(21))*params(16)-cr1__*exp(y(12))*params(7)*(cr1__-1)+T148;
residual(12)= lhs-rhs;
lhs =exp(y(11));
rhs =T154*T160*exp(y(31));
residual(13)= lhs-rhs;
lhs =exp(y(26));
rhs =exp(y(16))*(1-params(11));
residual(14)= lhs-rhs;
lhs =exp(y(24));
rhs =exp(y(15))*(1-params(11));
residual(15)= lhs-rhs;
lhs =exp(y(27));
rhs =exp(y(20))*params(11)+exp(y(9))*(1-params(11));
residual(16)= lhs-rhs;
lhs =exp(y(25));
rhs =exp(y(19))*params(11)+exp(y(18))*(1-params(11));
residual(17)= lhs-rhs;
lhs =exp(y(22));
rhs =T189*T190;
residual(18)= lhs-rhs;
lhs =y(28)+y(34);
rhs =y(33)+exp(y(1))/exp(y(12))*y(8);
residual(19)= lhs-rhs;
lhs =y(28);
rhs =(1-params(11))*y(30)+y(29)*params(11);
residual(20)= lhs-rhs;
lhs =y(29);
rhs =params(37)+params(19)*(y(34)-params(18))+params(19)*(y(33)-params(14));
residual(21)= lhs-rhs;
lhs =y(30);
rhs =params(36);
residual(22)= lhs-rhs;
lhs =exp(y(22));
rhs =y(33)+exp(y(26))+exp(y(27))+T225;
residual(23)= lhs-rhs;
lhs =y(33);
rhs =params(14)*(1-params(12))+params(12)*y(7)+x(it_, 1);
residual(24)= lhs-rhs;
lhs =y(32);
rhs =(1-params(13))*log(params(35))+params(13)*y(6)+x(it_, 2);
residual(25)= lhs-rhs;
lhs =y(31);
rhs =params(17)*y(5)+x(it_, 3);
residual(26)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(26, 43);

  %
  % Jacobian matrix
  %

T22 = exp(y(16))/exp(y(3));
T30 = exp(y(39))/exp(y(16));
T33 = T30^2;
T263 = params(1)*(-(exp(y(10))*exp(y(35))))/(exp(y(10))*exp(y(10)));
T335 = (-(exp(y(16))*exp(y(3))))/(exp(y(3))*exp(y(3)));
T360 = (-(exp(y(16))*exp(y(39))))/(exp(y(16))*exp(y(16)));
T395 = (-((1-params(6))*exp(y(21))*exp(y(22))/exp(y(25))));
  g1(1,9)=(-exp(y(9)))/(exp(y(9))*exp(y(9)));
  g1(1,10)=(-exp(y(10)));
  g1(2,10)=exp(y(10));
  g1(2,35)=(-(exp(y(35))*params(1)*exp(y(11))/exp(y(36))));
  g1(2,11)=(-(exp(y(35))*params(1)*exp(y(11))/exp(y(36))));
  g1(2,36)=(-((-(exp(y(36))*exp(y(35))*params(1)*exp(y(11))))/(exp(y(36))*exp(y(36)))));
  g1(3,10)=(-((exp(y(37))+exp(y(38))*(1-params(3)))*T263));
  g1(3,35)=(-(T53*(exp(y(37))+exp(y(38))*(1-params(3)))));
  g1(3,37)=(-(T53*exp(y(37))));
  g1(3,14)=exp(y(14));
  g1(3,38)=(-(T53*exp(y(38))*(1-params(3))));
  g1(4,10)=(-(dsinvP__*exp(y(38))*T263));
  g1(4,35)=(-(T53*exp(y(38))*dsinvP__));
  g1(4,14)=(-(exp(y(14))*(1-sinv__-dsinv__)));
  g1(4,38)=(-(T53*exp(y(38))*dsinvP__));
  g1(4,3)=(-(exp(y(14))*((-(0.5*params(2)*T335*2*(T22-1)))-(params(2)*(T22-1)*T335+T22*params(2)*T335))));
  g1(4,16)=(-(exp(y(14))*((-(0.5*params(2)*T22*2*(T22-1)))-(T22*params(2)*(T22-1)+T22*params(2)*T22))+T53*exp(y(38))*(T33*params(2)*T360+params(2)*(T30-1)*T360*2*T30)));
  g1(4,39)=(-(T53*exp(y(38))*(T33*params(2)*T30+params(2)*(T30-1)*T30*2*T30)));
  g1(5,2)=(-((1-params(3))*exp(y(2))));
  g1(5,15)=exp(y(15));
  g1(5,3)=(-(exp(y(16))*(-(0.5*params(2)*T335*2*(T22-1)))));
  g1(5,16)=(-(exp(y(16))*(1-sinv__)+exp(y(16))*(-(0.5*params(2)*T22*2*(T22-1)))));
  g1(6,10)=(-(exp(y(10))*exp(y(17))));
  g1(6,17)=(-(exp(y(10))*exp(y(17))));
  g1(6,18)=params(5)*exp(y(18))*getPowerDeriv(exp(y(18)),params(4),1);
  g1(7,17)=(-(exp(y(17))*exp(y(23))));
  g1(7,19)=params(5)*exp(y(19))*getPowerDeriv(exp(y(19)),params(4),1);
  g1(7,23)=(-(exp(y(17))*exp(y(23))));
  g1(8,20)=(-exp(y(20)))/(exp(y(20))*exp(y(20)));
  g1(8,23)=(-exp(y(23)));
  g1(9,17)=(-(exp(y(17))*exp(y(19))));
  g1(9,19)=(-(exp(y(17))*exp(y(19))));
  g1(9,20)=exp(y(20));
  g1(9,29)=1;
  g1(10,17)=exp(y(17));
  g1(10,21)=T395;
  g1(10,22)=T395;
  g1(10,25)=(-((-((1-params(6))*exp(y(21))*exp(y(22))*exp(y(25))))/(exp(y(25))*exp(y(25)))));
  g1(11,13)=exp(y(13));
  g1(11,21)=(-(exp(y(22))*params(6)*exp(y(21))/exp(y(4))));
  g1(11,22)=(-(exp(y(22))*params(6)*exp(y(21))/exp(y(4))));
  g1(11,4)=(-((-(exp(y(22))*params(6)*exp(y(21))*exp(y(4))))/(exp(y(4))*exp(y(4)))));
  g1(12,10)=(-(exp(y(40))*exp(y(36))*cr2__*(cr2__-1)*params(7)*T263/exp(y(22))));
  g1(12,35)=(-T148);
  g1(12,12)=T11*exp(y(12))*params(7)*(cr1__-1)+cr1__*(exp(y(12))*params(7)*(cr1__-1)+T11*exp(y(12))*params(7));
  g1(12,36)=(-(exp(y(40))*(exp(y(36))*cr2__*T53*params(7)*(cr2__-1)+exp(y(36))*(exp(y(36))/params(8)*T53*params(7)*(cr2__-1)+cr2__*exp(y(36))/params(8)*T53*params(7)))/exp(y(22))));
  g1(12,21)=(-(exp(y(21))*params(16)));
  g1(12,22)=(-((-(exp(y(22))*exp(y(36))*cr2__*T53*params(7)*(cr2__-1)*exp(y(40))))/(exp(y(22))*exp(y(22)))));
  g1(12,40)=(-T148);
  g1(13,1)=(-(exp(y(31))*T160*exp(y(1))*getPowerDeriv(exp(y(1)),params(10),1)));
  g1(13,11)=exp(y(11));
  g1(13,12)=(-(exp(y(31))*T154*params(15)*T11*getPowerDeriv(T11,params(9),1)*getPowerDeriv(T158,1-params(10),1)));
  g1(13,31)=(-(T154*T160*exp(y(31))));
  g1(14,16)=(-(exp(y(16))*(1-params(11))));
  g1(14,26)=exp(y(26));
  g1(15,15)=(-(exp(y(15))*(1-params(11))));
  g1(15,24)=exp(y(24));
  g1(16,9)=(-(exp(y(9))*(1-params(11))));
  g1(16,20)=(-(exp(y(20))*params(11)));
  g1(16,27)=exp(y(27));
  g1(17,18)=(-(exp(y(18))*(1-params(11))));
  g1(17,19)=(-(exp(y(19))*params(11)));
  g1(17,25)=exp(y(25));
  g1(18,22)=exp(y(22));
  g1(18,4)=(-(T190*exp(y(32))*exp(y(4))*getPowerDeriv(exp(y(4)),params(6),1)));
  g1(18,25)=(-(T189*exp(y(25))*getPowerDeriv(exp(y(25)),1-params(6),1)));
  g1(18,32)=(-(T189*T190));
  g1(19,1)=(-(exp(y(1))/exp(y(12))*y(8)));
  g1(19,12)=(-(y(8)*(-(exp(y(12))*exp(y(1))))/(exp(y(12))*exp(y(12)))));
  g1(19,28)=1;
  g1(19,33)=(-1);
  g1(19,8)=(-(exp(y(1))/exp(y(12))));
  g1(19,34)=1;
  g1(20,28)=1;
  g1(20,29)=(-params(11));
  g1(20,30)=(-(1-params(11)));
  g1(21,29)=1;
  g1(21,33)=(-params(19));
  g1(21,34)=(-params(19));
  g1(22,30)=1;
  g1(23,12)=(-(params(7)*0.5*exp(y(22))*T11*2*(cr1__-1)));
  g1(23,22)=exp(y(22))-T225;
  g1(23,26)=(-exp(y(26)));
  g1(23,27)=(-exp(y(27)));
  g1(23,33)=(-1);
  g1(24,7)=(-params(12));
  g1(24,33)=1;
  g1(24,41)=(-1);
  g1(25,6)=(-params(13));
  g1(25,32)=1;
  g1(25,42)=(-1);
  g1(26,5)=(-params(17));
  g1(26,31)=1;
  g1(26,43)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],26,1849);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],26,79507);
end
end
end
end
