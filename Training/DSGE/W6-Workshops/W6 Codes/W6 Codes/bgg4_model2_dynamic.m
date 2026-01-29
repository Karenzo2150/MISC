function [residual, g1, g2, g3] = bgg4_model2_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(38, 1);
T125 = params(47)/params(2);
T163 = (1-params(26))*(1-params(2)*params(26))/params(26)/(1+params(2)*params(27));
T189 = (-params(3))*(1-params(4))/(1+params(4));
T257 = 1/params(3)*1/(1-params(4));
T261 = 1/params(3)*params(4)/(1-params(4));
T284 = (1-params(24))*(1-params(2)*params(24))/params(24)/(1+params(2)*params(25));
T340 = (1-params(21))*(1-params(2)*params(21))/(params(21)*(1+params(5)*params(23)));
lhs =params(42)*y(43);
rhs =((1-params(36))*params(48)+(1-params(35))*params(13))*y(44)+params(49)*y(45)+params(8)*y(32);
residual(1)= lhs-rhs;
lhs =((1-params(36))*params(48)+(1-params(35))*params(13))*y(44);
rhs =(1-params(36))*params(19)*y(24)+(1-params(36))*params(18)*y(37)-(1-params(36))*(params(19)+params(18))*params(37)*y(48)+(1-params(35))*params(13)*(y(34)-params(38)*(y(48)-y(49)));
residual(2)= lhs-rhs;
lhs =y(45);
rhs =y(61)-params(39)*(y(48)-y(51));
residual(3)= lhs-rhs;
lhs =params(43)*y(46);
rhs =y(24)*params(36)*params(19)+y(37)*params(36)*params(18)-params(37)*params(36)*(params(19)+params(18))*y(54)+params(35)*params(13)*(y(34)-params(38)*(y(54)-y(49)));
residual(4)= lhs-rhs;
lhs =params(44)*y(47);
rhs =params(49)*y(45)+params(40)*y(60);
residual(5)= lhs-rhs;
lhs =params(44)*y(50);
rhs =params(49)*y(48)+params(40)*(y(51)+y(59));
residual(6)= lhs-rhs;
lhs =y(51);
rhs =y(14)+y(52)+y(58)-y(26);
residual(7)= lhs-rhs;
lhs =y(48);
rhs =y(13)+y(56)-y(26);
residual(8)= lhs-rhs;
lhs =y(25);
rhs =y(57)+y(67)+params(46)*y(53);
residual(9)= lhs-rhs;
lhs =params(47)*(y(51)+y(53));
rhs =T125*(y(51)+y(19)+(1+params(46))*y(15)-y(58))+params(43)*(y(51)+y(46))+params(40)*params(45)*(y(60)+y(51)+y(59))-params(44)*(y(47)+y(50));
residual(10)= lhs-rhs;
lhs =y(55);
rhs =params(2)/(1+params(2)*params(27))*y(68)+params(27)/(1+params(2)*params(27))*y(17)+T163*(y(51)-y(54));
residual(11)= lhs-rhs;
lhs =y(54);
rhs =y(55)+y(16)-y(26);
residual(12)= lhs-rhs;
lhs =y(49);
rhs =(1-params(35))*y(48)+params(35)*y(54);
residual(13)= lhs-rhs;
lhs =0;
rhs =(1-params(36))*y(48)+params(36)*y(54);
residual(14)= lhs-rhs;
lhs =y(29);
rhs =params(42)*y(43)+params(40)*y(60);
residual(15)= lhs-rhs;
lhs =y(24);
rhs =T189*(y(25)-y(63))+1/(1+params(4))*y(62)+params(4)/(1+params(4))*y(1);
residual(16)= lhs-rhs;
lhs =y(37);
rhs =y(36);
residual(17)= lhs-rhs;
lhs =y(65)-(y(57)+y(67)-y(63));
rhs =params(1)*y(40);
residual(18)= lhs-rhs;
lhs =y(40);
rhs =params(1)*params(20)*(y(39)+y(35)-y(36));
residual(19)= lhs-rhs;
lhs =y(38);
rhs =(1-params(12))*(y(43)+y(30)-y(9))+y(39)*params(12)-y(11);
residual(20)= lhs-rhs;
lhs =y(39)-y(49);
rhs =params(9)*(y(34)-y(8))-params(2)*params(9)*(y(64)-y(34));
residual(21)= lhs-rhs;
lhs =y(43);
rhs =y(31)+y(9)*params(6)+(1-params(6))*y(27);
residual(22)= lhs-rhs;
lhs =y(41);
rhs =y(27)*params(5)+y(24)*T257-y(1)*T261;
residual(23)= lhs-rhs;
lhs =y(28);
rhs =y(43)+y(30)-y(27);
residual(24)= lhs-rhs;
lhs =y(56);
rhs =params(2)/(1+params(2)*params(25))*y(69)+params(25)/(1+params(2)*params(25))*y(18)+T284*(y(30)-y(48));
residual(25)= lhs-rhs;
lhs =y(35);
rhs =y(34)*params(7)+y(9)*(1-params(7));
residual(26)= lhs-rhs;
lhs =y(36);
rhs =params(1)*(y(38)*params(14)-(params(14)-1)*(y(52)+y(19)+y(12)-y(26))+y(10));
residual(27)= lhs-rhs;
lhs =y(25);
rhs =params(28)*y(2)+y(26)*(1-params(28))*params(29)+y(29)*(1-params(28))*params(30)+y(52)*(1-params(28))*params(31)+y(33);
residual(28)= lhs-rhs;
lhs =y(42);
rhs =params(22)*y(3)+T340*(y(41)-y(28))+params(2)*y(66)-y(26)*params(2)*params(22);
residual(29)= lhs-rhs;
lhs =y(42);
rhs =y(26)+y(28)-y(4);
residual(30)= lhs-rhs;
lhs =y(32);
rhs =params(33)*y(6)+x(it_, 2)*params(61);
residual(31)= lhs-rhs;
lhs =y(31);
rhs =params(32)*y(5)+x(it_, 1)*params(62);
residual(32)= lhs-rhs;
lhs =y(33);
rhs =params(34)*y(7)+x(it_, 3)*params(60);
residual(33)= lhs-rhs;
lhs =y(57);
rhs =y(19)*params(50)+x(it_, 4)*params(55);
residual(34)= lhs-rhs;
lhs =y(58);
rhs =params(51)*y(20)+x(it_, 5)*params(56);
residual(35)= lhs-rhs;
lhs =y(59);
rhs =params(52)*y(21)+x(it_, 6)*params(57);
residual(36)= lhs-rhs;
lhs =y(60);
rhs =params(53)*y(22)+x(it_, 7)*params(58);
residual(37)= lhs-rhs;
lhs =y(61);
rhs =params(54)*y(23)+x(it_, 8)*params(59);
residual(38)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(38, 77);

  %
  % Jacobian matrix
  %

  g1(1,32)=(-params(8));
  g1(1,43)=params(42);
  g1(1,44)=(-((1-params(36))*params(48)+(1-params(35))*params(13)));
  g1(1,45)=(-params(49));
  g1(2,24)=(-((1-params(36))*params(19)));
  g1(2,34)=(-((1-params(35))*params(13)));
  g1(2,37)=(-((1-params(36))*params(18)));
  g1(2,44)=(1-params(36))*params(48)+(1-params(35))*params(13);
  g1(2,48)=(-((-((1-params(36))*(params(19)+params(18))*params(37)))+(1-params(35))*params(13)*(-params(38))));
  g1(2,49)=(-((1-params(35))*params(13)*params(38)));
  g1(3,45)=1;
  g1(3,48)=params(39);
  g1(3,51)=(-params(39));
  g1(3,61)=(-1);
  g1(4,24)=(-(params(36)*params(19)));
  g1(4,34)=(-(params(35)*params(13)));
  g1(4,37)=(-(params(36)*params(18)));
  g1(4,46)=params(43);
  g1(4,49)=(-(params(38)*params(35)*params(13)));
  g1(4,54)=(-((-(params(37)*params(36)*(params(19)+params(18))))+params(35)*params(13)*(-params(38))));
  g1(5,45)=(-params(49));
  g1(5,47)=params(44);
  g1(5,60)=(-params(40));
  g1(6,48)=(-params(49));
  g1(6,50)=params(44);
  g1(6,51)=(-params(40));
  g1(6,59)=(-params(40));
  g1(7,26)=1;
  g1(7,14)=(-1);
  g1(7,51)=1;
  g1(7,52)=(-1);
  g1(7,58)=(-1);
  g1(8,26)=1;
  g1(8,13)=(-1);
  g1(8,48)=1;
  g1(8,56)=(-1);
  g1(9,25)=1;
  g1(9,67)=(-1);
  g1(9,53)=(-params(46));
  g1(9,57)=(-1);
  g1(10,46)=(-params(43));
  g1(10,47)=params(44);
  g1(10,50)=params(44);
  g1(10,51)=params(47)-(params(40)*params(45)+params(43)+T125);
  g1(10,15)=(-(T125*(1+params(46))));
  g1(10,53)=params(47);
  g1(10,19)=(-T125);
  g1(10,58)=T125;
  g1(10,59)=(-(params(40)*params(45)));
  g1(10,60)=(-(params(40)*params(45)));
  g1(11,51)=(-T163);
  g1(11,54)=T163;
  g1(11,17)=(-(params(27)/(1+params(2)*params(27))));
  g1(11,55)=1;
  g1(11,68)=(-(params(2)/(1+params(2)*params(27))));
  g1(12,26)=1;
  g1(12,16)=(-1);
  g1(12,54)=1;
  g1(12,55)=(-1);
  g1(13,48)=(-(1-params(35)));
  g1(13,49)=1;
  g1(13,54)=(-params(35));
  g1(14,48)=(-(1-params(36)));
  g1(14,54)=(-params(36));
  g1(15,29)=1;
  g1(15,43)=(-params(42));
  g1(15,60)=(-params(40));
  g1(16,1)=(-(params(4)/(1+params(4))));
  g1(16,24)=1;
  g1(16,62)=(-(1/(1+params(4))));
  g1(16,25)=(-T189);
  g1(16,63)=T189;
  g1(17,36)=(-1);
  g1(17,37)=1;
  g1(18,63)=1;
  g1(18,65)=1;
  g1(18,40)=(-params(1));
  g1(18,67)=(-1);
  g1(18,57)=(-1);
  g1(19,35)=(-(params(1)*params(20)));
  g1(19,36)=params(1)*params(20);
  g1(19,39)=(-(params(1)*params(20)));
  g1(19,40)=1;
  g1(20,30)=(-(1-params(12)));
  g1(20,9)=1-params(12);
  g1(20,38)=1;
  g1(20,11)=1;
  g1(20,39)=(-params(12));
  g1(20,43)=(-(1-params(12)));
  g1(21,8)=params(9);
  g1(21,34)=(-(params(9)-(-(params(2)*params(9)))));
  g1(21,64)=params(2)*params(9);
  g1(21,39)=1;
  g1(21,49)=(-1);
  g1(22,27)=(-(1-params(6)));
  g1(22,31)=(-1);
  g1(22,9)=(-params(6));
  g1(22,43)=1;
  g1(23,1)=T261;
  g1(23,24)=(-T257);
  g1(23,27)=(-params(5));
  g1(23,41)=1;
  g1(24,27)=1;
  g1(24,28)=1;
  g1(24,30)=(-1);
  g1(24,43)=(-1);
  g1(25,30)=(-T284);
  g1(25,48)=T284;
  g1(25,18)=(-(params(25)/(1+params(2)*params(25))));
  g1(25,56)=1;
  g1(25,69)=(-(params(2)/(1+params(2)*params(25))));
  g1(26,34)=(-params(7));
  g1(26,9)=(-(1-params(7)));
  g1(26,35)=1;
  g1(27,26)=(-(params(1)*(params(14)-1)));
  g1(27,10)=(-params(1));
  g1(27,36)=1;
  g1(27,38)=(-(params(1)*params(14)));
  g1(27,12)=(-(params(1)*(-(params(14)-1))));
  g1(27,52)=(-(params(1)*(-(params(14)-1))));
  g1(27,19)=(-(params(1)*(-(params(14)-1))));
  g1(28,2)=(-params(28));
  g1(28,25)=1;
  g1(28,26)=(-((1-params(28))*params(29)));
  g1(28,29)=(-((1-params(28))*params(30)));
  g1(28,33)=(-1);
  g1(28,52)=(-((1-params(28))*params(31)));
  g1(29,3)=(-params(22));
  g1(29,26)=params(2)*params(22);
  g1(29,28)=T340;
  g1(29,41)=(-T340);
  g1(29,42)=1;
  g1(29,66)=(-params(2));
  g1(30,26)=(-1);
  g1(30,4)=1;
  g1(30,28)=(-1);
  g1(30,42)=1;
  g1(31,6)=(-params(33));
  g1(31,32)=1;
  g1(31,71)=(-params(61));
  g1(32,5)=(-params(32));
  g1(32,31)=1;
  g1(32,70)=(-params(62));
  g1(33,7)=(-params(34));
  g1(33,33)=1;
  g1(33,72)=(-params(60));
  g1(34,19)=(-params(50));
  g1(34,57)=1;
  g1(34,73)=(-params(55));
  g1(35,20)=(-params(51));
  g1(35,58)=1;
  g1(35,74)=(-params(56));
  g1(36,21)=(-params(52));
  g1(36,59)=1;
  g1(36,75)=(-params(57));
  g1(37,22)=(-params(53));
  g1(37,60)=1;
  g1(37,76)=(-params(58));
  g1(38,23)=(-params(54));
  g1(38,61)=1;
  g1(38,77)=(-params(59));

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],38,5929);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],38,456533);
end
end
end
end
