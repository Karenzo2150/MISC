function [residual, g1, g2, g3] = nk_2soe3_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(40, 1);
T81 = params(3)/(1-params(3));
T159 = (1-params(6))*(1-params(1)*params(6))/params(6);
lhs =y(39);
rhs =y(38)-params(4)*y(41);
residual(1)= lhs-rhs;
lhs =y(40);
rhs =y(38)-params(4)*y(42);
residual(2)= lhs-rhs;
lhs =0;
rhs =y(41)*(1-params(3))+y(42)*params(3);
residual(3)= lhs-rhs;
lhs =y(38);
rhs =(-params(2))*(y(43)-y(60))+y(58)+params(2)*y(26)*(1-params(12));
residual(4)= lhs-rhs;
lhs =y(43)-y(60);
rhs =y(34)-y(57)+y(59)-y(42)+params(15)*y(50)+y(29);
residual(5)= lhs-rhs;
lhs =y(46);
rhs =params(5)*y(45)+y(38)*1/params(2);
residual(6)= lhs-rhs;
lhs =y(47);
rhs =y(45)+y(25);
residual(7)= lhs-rhs;
lhs =0;
rhs =y(48)-y(41);
residual(8)= lhs-rhs;
lhs =y(48);
rhs =y(46)-y(25);
residual(9)= lhs-rhs;
lhs =y(47);
rhs =y(39)*(1-params(3))+params(3)*(y(28)-params(10)*(y(41)-y(42)));
residual(10)= lhs-rhs;
lhs =y(44);
rhs =T81*(y(42)-y(11));
residual(11)= lhs-rhs;
lhs =y(50);
rhs =1/params(1)*y(12)+params(3)*(y(40)+y(42))-params(3)*(y(41)+y(28)-params(10)*(y(41)-y(42)));
residual(12)= lhs-rhs;
lhs =y(49);
rhs =y(44)+y(42)-y(11)-y(35);
residual(13)= lhs-rhs;
lhs =y(51);
rhs =y(28)-params(10)*(y(41)-y(42));
residual(14)= lhs-rhs;
lhs =y(52);
rhs =params(3)*(y(41)+y(51)-y(42)-y(40));
residual(15)= lhs-rhs;
lhs =y(14);
rhs =y(13)-params(4)*y(16);
residual(16)= lhs-rhs;
lhs =y(15);
rhs =y(13)-params(4)*y(17);
residual(17)= lhs-rhs;
lhs =0;
rhs =(1-params(3))*y(16)+params(3)*y(17);
residual(18)= lhs-rhs;
lhs =y(13);
rhs =params(2)*y(26)*(1-params(12))+(-params(2))*(y(18)-y(55))+y(53);
residual(19)= lhs-rhs;
lhs =y(18)-y(55);
rhs =y(29)+y(34)-y(57)+y(54)-y(17)+params(15)*y(32);
residual(20)= lhs-rhs;
lhs =y(22);
rhs =params(5)*y(21)+1/params(2)*y(13);
residual(21)= lhs-rhs;
lhs =y(23);
rhs =y(25)+y(21);
residual(22)= lhs-rhs;
lhs =y(20);
rhs =params(1)*y(56)+T159*(y(24)-y(16))+y(30);
residual(23)= lhs-rhs;
lhs =y(24);
rhs =y(22)-y(25);
residual(24)= lhs-rhs;
residual(25) = y(31);
lhs =y(23);
rhs =(1-params(3))*y(14)+params(3)*(y(28)-params(10)*(y(16)-y(17)));
residual(26)= lhs-rhs;
lhs =y(19);
rhs =y(20)+T81*(y(17)-y(1));
residual(27)= lhs-rhs;
lhs =y(32);
rhs =1/params(1)*y(8)+params(3)*(y(15)+y(17))-params(3)*(y(28)+y(16)-params(10)*(y(16)-y(17)));
residual(28)= lhs-rhs;
lhs =y(31);
rhs =y(19)+y(17)-y(1)-y(35);
residual(29)= lhs-rhs;
lhs =y(33);
rhs =y(28)-params(10)*(y(16)-y(17));
residual(30)= lhs-rhs;
lhs =y(36);
rhs =params(3)*(y(16)+y(33)-y(17)-y(15));
residual(31)= lhs-rhs;
lhs =y(25);
rhs =params(11)*y(2)+x(it_, 1);
residual(32)= lhs-rhs;
lhs =y(26);
rhs =params(12)*y(3)+x(it_, 2);
residual(33)= lhs-rhs;
lhs =y(27);
rhs =params(13)*y(4)+x(it_, 3);
residual(34)= lhs-rhs;
lhs =y(28);
rhs =params(14)*y(5)+x(it_, 4);
residual(35)= lhs-rhs;
lhs =y(34);
rhs =params(16)*y(9)+x(it_, 5);
residual(36)= lhs-rhs;
lhs =y(35);
rhs =params(17)*y(10)+x(it_, 6);
residual(37)= lhs-rhs;
lhs =y(29);
rhs =params(18)*y(6)+x(it_, 7);
residual(38)= lhs-rhs;
lhs =y(30);
rhs =params(19)*y(7)+x(it_, 8);
residual(39)= lhs-rhs;
lhs =y(37);
rhs =y(23)-y(47);
residual(40)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(40, 68);

  %
  % Jacobian matrix
  %

  g1(1,38)=(-1);
  g1(1,39)=1;
  g1(1,41)=params(4);
  g1(2,38)=(-1);
  g1(2,40)=1;
  g1(2,42)=params(4);
  g1(3,41)=(-(1-params(3)));
  g1(3,42)=(-params(3));
  g1(4,26)=(-(params(2)*(1-params(12))));
  g1(4,38)=1;
  g1(4,58)=(-1);
  g1(4,43)=params(2);
  g1(4,60)=(-params(2));
  g1(5,29)=(-1);
  g1(5,34)=(-1);
  g1(5,57)=1;
  g1(5,42)=1;
  g1(5,59)=(-1);
  g1(5,43)=1;
  g1(5,60)=(-1);
  g1(5,50)=(-params(15));
  g1(6,38)=(-(1/params(2)));
  g1(6,45)=(-params(5));
  g1(6,46)=1;
  g1(7,25)=(-1);
  g1(7,45)=(-1);
  g1(7,47)=1;
  g1(8,41)=1;
  g1(8,48)=(-1);
  g1(9,25)=1;
  g1(9,46)=(-1);
  g1(9,48)=1;
  g1(10,28)=(-params(3));
  g1(10,39)=(-(1-params(3)));
  g1(10,41)=(-(params(3)*(-params(10))));
  g1(10,42)=(-(params(3)*params(10)));
  g1(10,47)=1;
  g1(11,11)=T81;
  g1(11,42)=(-T81);
  g1(11,44)=1;
  g1(12,28)=params(3);
  g1(12,40)=(-params(3));
  g1(12,41)=params(3)*(1-params(10));
  g1(12,42)=(-(params(3)-params(3)*params(10)));
  g1(12,12)=(-(1/params(1)));
  g1(12,50)=1;
  g1(13,35)=1;
  g1(13,11)=1;
  g1(13,42)=(-1);
  g1(13,44)=(-1);
  g1(13,49)=1;
  g1(14,28)=(-1);
  g1(14,41)=params(10);
  g1(14,42)=(-params(10));
  g1(14,51)=1;
  g1(15,40)=params(3);
  g1(15,41)=(-params(3));
  g1(15,42)=params(3);
  g1(15,51)=(-params(3));
  g1(15,52)=1;
  g1(16,13)=(-1);
  g1(16,14)=1;
  g1(16,16)=params(4);
  g1(17,13)=(-1);
  g1(17,15)=1;
  g1(17,17)=params(4);
  g1(18,16)=(-(1-params(3)));
  g1(18,17)=(-params(3));
  g1(19,13)=1;
  g1(19,53)=(-1);
  g1(19,18)=params(2);
  g1(19,55)=(-params(2));
  g1(19,26)=(-(params(2)*(1-params(12))));
  g1(20,17)=1;
  g1(20,54)=(-1);
  g1(20,18)=1;
  g1(20,55)=(-1);
  g1(20,29)=(-1);
  g1(20,32)=(-params(15));
  g1(20,34)=(-1);
  g1(20,57)=1;
  g1(21,13)=(-(1/params(2)));
  g1(21,21)=(-params(5));
  g1(21,22)=1;
  g1(22,21)=(-1);
  g1(22,23)=1;
  g1(22,25)=(-1);
  g1(23,16)=T159;
  g1(23,20)=1;
  g1(23,56)=(-params(1));
  g1(23,24)=(-T159);
  g1(23,30)=(-1);
  g1(24,22)=(-1);
  g1(24,24)=1;
  g1(24,25)=1;
  g1(25,31)=1;
  g1(26,14)=(-(1-params(3)));
  g1(26,16)=(-(params(3)*(-params(10))));
  g1(26,17)=(-(params(3)*params(10)));
  g1(26,23)=1;
  g1(26,28)=(-params(3));
  g1(27,1)=T81;
  g1(27,17)=(-T81);
  g1(27,19)=1;
  g1(27,20)=(-1);
  g1(28,15)=(-params(3));
  g1(28,16)=params(3)*(1-params(10));
  g1(28,17)=(-(params(3)-params(3)*params(10)));
  g1(28,28)=params(3);
  g1(28,8)=(-(1/params(1)));
  g1(28,32)=1;
  g1(29,1)=1;
  g1(29,17)=(-1);
  g1(29,19)=(-1);
  g1(29,31)=1;
  g1(29,35)=1;
  g1(30,16)=params(10);
  g1(30,17)=(-params(10));
  g1(30,28)=(-1);
  g1(30,33)=1;
  g1(31,15)=params(3);
  g1(31,16)=(-params(3));
  g1(31,17)=params(3);
  g1(31,33)=(-params(3));
  g1(31,36)=1;
  g1(32,2)=(-params(11));
  g1(32,25)=1;
  g1(32,61)=(-1);
  g1(33,3)=(-params(12));
  g1(33,26)=1;
  g1(33,62)=(-1);
  g1(34,4)=(-params(13));
  g1(34,27)=1;
  g1(34,63)=(-1);
  g1(35,5)=(-params(14));
  g1(35,28)=1;
  g1(35,64)=(-1);
  g1(36,9)=(-params(16));
  g1(36,34)=1;
  g1(36,65)=(-1);
  g1(37,10)=(-params(17));
  g1(37,35)=1;
  g1(37,66)=(-1);
  g1(38,6)=(-params(18));
  g1(38,29)=1;
  g1(38,67)=(-1);
  g1(39,7)=(-params(19));
  g1(39,30)=1;
  g1(39,68)=(-1);
  g1(40,23)=(-1);
  g1(40,37)=1;
  g1(40,47)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],40,4624);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],40,314432);
end
end
end
end
