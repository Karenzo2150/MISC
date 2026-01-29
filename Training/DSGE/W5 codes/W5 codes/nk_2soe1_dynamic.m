function [residual, g1, g2, g3] = nk_2soe1_dynamic(y, x, params, steady_state, it_)
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
lhs =y(40);
rhs =y(39)-params(4)*y(42);
residual(1)= lhs-rhs;
lhs =y(41);
rhs =y(39)-params(4)*y(43);
residual(2)= lhs-rhs;
lhs =0;
rhs =y(42)*(1-params(3))+y(43)*params(3);
residual(3)= lhs-rhs;
lhs =y(39);
rhs =(-params(2))*(y(44)-y(61))+y(59)+params(2)*y(27)*(1-params(12));
residual(4)= lhs-rhs;
lhs =y(44)-y(61);
rhs =y(35)-y(58)+y(60)-y(43)+params(15)*y(51)+y(30);
residual(5)= lhs-rhs;
lhs =y(47);
rhs =params(5)*y(46)+y(39)*1/params(2);
residual(6)= lhs-rhs;
lhs =y(48);
rhs =y(46)+y(26);
residual(7)= lhs-rhs;
lhs =0;
rhs =y(49)-y(42);
residual(8)= lhs-rhs;
lhs =y(49);
rhs =y(47)-y(26);
residual(9)= lhs-rhs;
lhs =y(48);
rhs =y(40)*(1-params(3))+params(3)*(y(29)-params(10)*(y(42)-y(43)));
residual(10)= lhs-rhs;
lhs =y(45);
rhs =T81*(y(43)-y(12));
residual(11)= lhs-rhs;
lhs =y(51);
rhs =1/params(1)*y(13)+params(3)*(y(41)+y(43))-params(3)*(y(42)+y(29)-params(10)*(y(42)-y(43)));
residual(12)= lhs-rhs;
lhs =y(50);
rhs =y(45)+y(43)-y(12)-y(36);
residual(13)= lhs-rhs;
lhs =y(52);
rhs =y(29)-params(10)*(y(42)-y(43));
residual(14)= lhs-rhs;
lhs =y(53);
rhs =params(3)*(y(42)+y(52)-y(43)-y(41));
residual(15)= lhs-rhs;
lhs =y(15);
rhs =y(14)-params(4)*y(17);
residual(16)= lhs-rhs;
lhs =y(16);
rhs =y(14)-params(4)*y(18);
residual(17)= lhs-rhs;
lhs =0;
rhs =(1-params(3))*y(17)+params(3)*y(18);
residual(18)= lhs-rhs;
lhs =y(14);
rhs =params(2)*y(27)*(1-params(12))+(-params(2))*(y(19)-y(56))+y(54);
residual(19)= lhs-rhs;
lhs =y(19)-y(56);
rhs =y(30)+y(35)-y(58)+y(55)-y(18)+params(15)*y(33);
residual(20)= lhs-rhs;
lhs =y(23);
rhs =params(5)*y(22)+1/params(2)*y(14);
residual(21)= lhs-rhs;
lhs =y(24);
rhs =y(26)+y(22);
residual(22)= lhs-rhs;
lhs =y(21);
rhs =params(1)*y(57)+T159*(y(25)-y(17))+y(31);
residual(23)= lhs-rhs;
lhs =y(25);
rhs =y(23)-y(26);
residual(24)= lhs-rhs;
lhs =y(19);
rhs =params(7)*y(2)+(1-params(7))*(params(8)*y(20)+y(24)*params(9))+y(28);
residual(25)= lhs-rhs;
lhs =y(24);
rhs =(1-params(3))*y(15)+params(3)*(y(29)-params(10)*(y(17)-y(18)));
residual(26)= lhs-rhs;
lhs =y(20);
rhs =y(21)+T81*(y(18)-y(1));
residual(27)= lhs-rhs;
lhs =y(33);
rhs =1/params(1)*y(9)+params(3)*(y(16)+y(18))-params(3)*(y(29)+y(17)-params(10)*(y(17)-y(18)));
residual(28)= lhs-rhs;
lhs =y(32);
rhs =y(20)+y(18)-y(1)-y(36);
residual(29)= lhs-rhs;
lhs =y(34);
rhs =y(29)-params(10)*(y(17)-y(18));
residual(30)= lhs-rhs;
lhs =y(37);
rhs =params(3)*(y(17)+y(34)-y(18)-y(16));
residual(31)= lhs-rhs;
lhs =y(26);
rhs =params(11)*y(3)+x(it_, 1);
residual(32)= lhs-rhs;
lhs =y(27);
rhs =params(12)*y(4)+x(it_, 2);
residual(33)= lhs-rhs;
lhs =y(28);
rhs =params(13)*y(5)+x(it_, 3);
residual(34)= lhs-rhs;
lhs =y(29);
rhs =params(14)*y(6)+x(it_, 4);
residual(35)= lhs-rhs;
lhs =y(35);
rhs =params(16)*y(10)+x(it_, 5);
residual(36)= lhs-rhs;
lhs =y(36);
rhs =params(17)*y(11)+x(it_, 6);
residual(37)= lhs-rhs;
lhs =y(30);
rhs =params(18)*y(7)+x(it_, 7);
residual(38)= lhs-rhs;
lhs =y(31);
rhs =params(19)*y(8)+x(it_, 8);
residual(39)= lhs-rhs;
lhs =y(38);
rhs =y(24)-y(48);
residual(40)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(40, 69);

  %
  % Jacobian matrix
  %

  g1(1,39)=(-1);
  g1(1,40)=1;
  g1(1,42)=params(4);
  g1(2,39)=(-1);
  g1(2,41)=1;
  g1(2,43)=params(4);
  g1(3,42)=(-(1-params(3)));
  g1(3,43)=(-params(3));
  g1(4,27)=(-(params(2)*(1-params(12))));
  g1(4,39)=1;
  g1(4,59)=(-1);
  g1(4,44)=params(2);
  g1(4,61)=(-params(2));
  g1(5,30)=(-1);
  g1(5,35)=(-1);
  g1(5,58)=1;
  g1(5,43)=1;
  g1(5,60)=(-1);
  g1(5,44)=1;
  g1(5,61)=(-1);
  g1(5,51)=(-params(15));
  g1(6,39)=(-(1/params(2)));
  g1(6,46)=(-params(5));
  g1(6,47)=1;
  g1(7,26)=(-1);
  g1(7,46)=(-1);
  g1(7,48)=1;
  g1(8,42)=1;
  g1(8,49)=(-1);
  g1(9,26)=1;
  g1(9,47)=(-1);
  g1(9,49)=1;
  g1(10,29)=(-params(3));
  g1(10,40)=(-(1-params(3)));
  g1(10,42)=(-(params(3)*(-params(10))));
  g1(10,43)=(-(params(3)*params(10)));
  g1(10,48)=1;
  g1(11,12)=T81;
  g1(11,43)=(-T81);
  g1(11,45)=1;
  g1(12,29)=params(3);
  g1(12,41)=(-params(3));
  g1(12,42)=params(3)*(1-params(10));
  g1(12,43)=(-(params(3)-params(3)*params(10)));
  g1(12,13)=(-(1/params(1)));
  g1(12,51)=1;
  g1(13,36)=1;
  g1(13,12)=1;
  g1(13,43)=(-1);
  g1(13,45)=(-1);
  g1(13,50)=1;
  g1(14,29)=(-1);
  g1(14,42)=params(10);
  g1(14,43)=(-params(10));
  g1(14,52)=1;
  g1(15,41)=params(3);
  g1(15,42)=(-params(3));
  g1(15,43)=params(3);
  g1(15,52)=(-params(3));
  g1(15,53)=1;
  g1(16,14)=(-1);
  g1(16,15)=1;
  g1(16,17)=params(4);
  g1(17,14)=(-1);
  g1(17,16)=1;
  g1(17,18)=params(4);
  g1(18,17)=(-(1-params(3)));
  g1(18,18)=(-params(3));
  g1(19,14)=1;
  g1(19,54)=(-1);
  g1(19,19)=params(2);
  g1(19,56)=(-params(2));
  g1(19,27)=(-(params(2)*(1-params(12))));
  g1(20,18)=1;
  g1(20,55)=(-1);
  g1(20,19)=1;
  g1(20,56)=(-1);
  g1(20,30)=(-1);
  g1(20,33)=(-params(15));
  g1(20,35)=(-1);
  g1(20,58)=1;
  g1(21,14)=(-(1/params(2)));
  g1(21,22)=(-params(5));
  g1(21,23)=1;
  g1(22,22)=(-1);
  g1(22,24)=1;
  g1(22,26)=(-1);
  g1(23,17)=T159;
  g1(23,21)=1;
  g1(23,57)=(-params(1));
  g1(23,25)=(-T159);
  g1(23,31)=(-1);
  g1(24,23)=(-1);
  g1(24,25)=1;
  g1(24,26)=1;
  g1(25,2)=(-params(7));
  g1(25,19)=1;
  g1(25,20)=(-((1-params(7))*params(8)));
  g1(25,24)=(-((1-params(7))*params(9)));
  g1(25,28)=(-1);
  g1(26,15)=(-(1-params(3)));
  g1(26,17)=(-(params(3)*(-params(10))));
  g1(26,18)=(-(params(3)*params(10)));
  g1(26,24)=1;
  g1(26,29)=(-params(3));
  g1(27,1)=T81;
  g1(27,18)=(-T81);
  g1(27,20)=1;
  g1(27,21)=(-1);
  g1(28,16)=(-params(3));
  g1(28,17)=params(3)*(1-params(10));
  g1(28,18)=(-(params(3)-params(3)*params(10)));
  g1(28,29)=params(3);
  g1(28,9)=(-(1/params(1)));
  g1(28,33)=1;
  g1(29,1)=1;
  g1(29,18)=(-1);
  g1(29,20)=(-1);
  g1(29,32)=1;
  g1(29,36)=1;
  g1(30,17)=params(10);
  g1(30,18)=(-params(10));
  g1(30,29)=(-1);
  g1(30,34)=1;
  g1(31,16)=params(3);
  g1(31,17)=(-params(3));
  g1(31,18)=params(3);
  g1(31,34)=(-params(3));
  g1(31,37)=1;
  g1(32,3)=(-params(11));
  g1(32,26)=1;
  g1(32,62)=(-1);
  g1(33,4)=(-params(12));
  g1(33,27)=1;
  g1(33,63)=(-1);
  g1(34,5)=(-params(13));
  g1(34,28)=1;
  g1(34,64)=(-1);
  g1(35,6)=(-params(14));
  g1(35,29)=1;
  g1(35,65)=(-1);
  g1(36,10)=(-params(16));
  g1(36,35)=1;
  g1(36,66)=(-1);
  g1(37,11)=(-params(17));
  g1(37,36)=1;
  g1(37,67)=(-1);
  g1(38,7)=(-params(18));
  g1(38,30)=1;
  g1(38,68)=(-1);
  g1(39,8)=(-params(19));
  g1(39,31)=1;
  g1(39,69)=(-1);
  g1(40,24)=(-1);
  g1(40,38)=1;
  g1(40,48)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],40,4761);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],40,328509);
end
end
end
end
