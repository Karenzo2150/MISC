function [residual, g1, g2, g3] = nk_3soe1b_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(25, 1);
T75 = (1-params(6))*(1-params(1)*params(6))/params(6);
lhs =y(14);
rhs =y(13)-params(4)*y(16);
residual(1)= lhs-rhs;
lhs =y(15);
rhs =y(13)-params(4)*y(17);
residual(2)= lhs-rhs;
lhs =0;
rhs =y(16)*(1-params(3))+y(17)*params(3);
residual(3)= lhs-rhs;
lhs =y(13);
rhs =(-params(2))*(y(18)-y(40))+y(38)+params(2)*y(26)*(1-params(12));
residual(4)= lhs-rhs;
lhs =y(18)-y(40);
rhs =y(34)-y(42)+y(39)-y(17)+params(15)*y(32)+y(29);
residual(5)= lhs-rhs;
lhs =y(22);
rhs =params(5)*y(21)+y(13)*1/params(2);
residual(6)= lhs-rhs;
lhs =y(23);
rhs =y(21)+y(25);
residual(7)= lhs-rhs;
lhs =y(20);
rhs =params(1)*y(41)+T75*(y(24)-y(16))+y(30);
residual(8)= lhs-rhs;
lhs =y(24);
rhs =y(22)-y(25);
residual(9)= lhs-rhs;
lhs =y(18);
rhs =params(7)*y(2)+(1-params(7))*(params(8)*y(19)+y(23)*params(9))+y(27);
residual(10)= lhs-rhs;
lhs =y(23);
rhs =y(14)*(1-params(3))+params(3)*(y(28)-params(10)*(y(16)-y(17)));
residual(11)= lhs-rhs;
lhs =y(19);
rhs =y(20)+params(3)/(1-params(3))*(y(17)-y(1));
residual(12)= lhs-rhs;
lhs =y(32)-y(37);
rhs =1/params(1)*(y(9)-y(12))+params(3)*(y(15)+y(17))-params(3)*(y(16)+y(28)-params(10)*(y(16)-y(17)));
residual(13)= lhs-rhs;
lhs =y(31);
rhs =y(19)+y(17)-y(1)-y(35);
residual(14)= lhs-rhs;
lhs =y(33);
rhs =y(28)-params(10)*(y(16)-y(17));
residual(15)= lhs-rhs;
lhs =y(36);
rhs =params(3)*(y(16)+y(33)-y(17)-y(15));
residual(16)= lhs-rhs;
lhs =y(25);
rhs =params(11)*y(3)+x(it_, 1);
residual(17)= lhs-rhs;
lhs =y(26);
rhs =params(12)*y(4)+x(it_, 2);
residual(18)= lhs-rhs;
lhs =y(27);
rhs =params(13)*y(5)+x(it_, 3);
residual(19)= lhs-rhs;
lhs =y(28);
rhs =params(14)*y(6)+x(it_, 4);
residual(20)= lhs-rhs;
lhs =y(34);
rhs =params(16)*y(10)+x(it_, 5);
residual(21)= lhs-rhs;
lhs =y(35);
rhs =params(17)*y(11)+x(it_, 6);
residual(22)= lhs-rhs;
lhs =y(29);
rhs =params(18)*y(7)+x(it_, 7);
residual(23)= lhs-rhs;
lhs =y(30);
rhs =params(19)*y(8)+x(it_, 8);
residual(24)= lhs-rhs;
lhs =y(37);
rhs =y(12)*params(20)+x(it_, 9);
residual(25)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(25, 51);

  %
  % Jacobian matrix
  %

  g1(1,13)=(-1);
  g1(1,14)=1;
  g1(1,16)=params(4);
  g1(2,13)=(-1);
  g1(2,15)=1;
  g1(2,17)=params(4);
  g1(3,16)=(-(1-params(3)));
  g1(3,17)=(-params(3));
  g1(4,13)=1;
  g1(4,38)=(-1);
  g1(4,18)=params(2);
  g1(4,40)=(-params(2));
  g1(4,26)=(-(params(2)*(1-params(12))));
  g1(5,17)=1;
  g1(5,39)=(-1);
  g1(5,18)=1;
  g1(5,40)=(-1);
  g1(5,29)=(-1);
  g1(5,32)=(-params(15));
  g1(5,34)=(-1);
  g1(5,42)=1;
  g1(6,13)=(-(1/params(2)));
  g1(6,21)=(-params(5));
  g1(6,22)=1;
  g1(7,21)=(-1);
  g1(7,23)=1;
  g1(7,25)=(-1);
  g1(8,16)=T75;
  g1(8,20)=1;
  g1(8,41)=(-params(1));
  g1(8,24)=(-T75);
  g1(8,30)=(-1);
  g1(9,22)=(-1);
  g1(9,24)=1;
  g1(9,25)=1;
  g1(10,2)=(-params(7));
  g1(10,18)=1;
  g1(10,19)=(-((1-params(7))*params(8)));
  g1(10,23)=(-((1-params(7))*params(9)));
  g1(10,27)=(-1);
  g1(11,14)=(-(1-params(3)));
  g1(11,16)=(-(params(3)*(-params(10))));
  g1(11,17)=(-(params(3)*params(10)));
  g1(11,23)=1;
  g1(11,28)=(-params(3));
  g1(12,1)=params(3)/(1-params(3));
  g1(12,17)=(-(params(3)/(1-params(3))));
  g1(12,19)=1;
  g1(12,20)=(-1);
  g1(13,15)=(-params(3));
  g1(13,16)=params(3)*(1-params(10));
  g1(13,17)=(-(params(3)-params(3)*params(10)));
  g1(13,28)=params(3);
  g1(13,9)=(-(1/params(1)));
  g1(13,32)=1;
  g1(13,12)=1/params(1);
  g1(13,37)=(-1);
  g1(14,1)=1;
  g1(14,17)=(-1);
  g1(14,19)=(-1);
  g1(14,31)=1;
  g1(14,35)=1;
  g1(15,16)=params(10);
  g1(15,17)=(-params(10));
  g1(15,28)=(-1);
  g1(15,33)=1;
  g1(16,15)=params(3);
  g1(16,16)=(-params(3));
  g1(16,17)=params(3);
  g1(16,33)=(-params(3));
  g1(16,36)=1;
  g1(17,3)=(-params(11));
  g1(17,25)=1;
  g1(17,43)=(-1);
  g1(18,4)=(-params(12));
  g1(18,26)=1;
  g1(18,44)=(-1);
  g1(19,5)=(-params(13));
  g1(19,27)=1;
  g1(19,45)=(-1);
  g1(20,6)=(-params(14));
  g1(20,28)=1;
  g1(20,46)=(-1);
  g1(21,10)=(-params(16));
  g1(21,34)=1;
  g1(21,47)=(-1);
  g1(22,11)=(-params(17));
  g1(22,35)=1;
  g1(22,48)=(-1);
  g1(23,7)=(-params(18));
  g1(23,29)=1;
  g1(23,49)=(-1);
  g1(24,8)=(-params(19));
  g1(24,30)=1;
  g1(24,50)=(-1);
  g1(25,12)=(-params(20));
  g1(25,37)=1;
  g1(25,51)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],25,2601);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],25,132651);
end
end
end
end
