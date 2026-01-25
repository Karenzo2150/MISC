function [residual, g1, g2, g3] = nk_1soe2_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(24, 1);
T75 = (1-params(6))*(1-params(1)*params(6))/params(6);
lhs =y(13);
rhs =y(12)-params(4)*y(15);
residual(1)= lhs-rhs;
lhs =y(14);
rhs =y(12)-params(4)*y(16);
residual(2)= lhs-rhs;
lhs =0;
rhs =y(15)*(1-params(3))+y(16)*params(3);
residual(3)= lhs-rhs;
lhs =y(12);
rhs =(-params(2))*(y(17)-y(38))+y(36)+params(2)*y(25)*(1-params(12));
residual(4)= lhs-rhs;
lhs =y(17)-y(38);
rhs =y(33)-y(40)+y(37)-y(16)+params(15)*y(31)+y(28);
residual(5)= lhs-rhs;
lhs =y(21);
rhs =params(5)*y(20)+y(12)*1/params(2);
residual(6)= lhs-rhs;
lhs =y(22);
rhs =y(20)+y(24);
residual(7)= lhs-rhs;
lhs =y(19);
rhs =params(1)*y(39)+T75*(y(23)-y(15))+y(29);
residual(8)= lhs-rhs;
lhs =y(23);
rhs =y(21)-y(24);
residual(9)= lhs-rhs;
lhs =y(17);
rhs =params(9)*y(2)+(1-params(9))*(y(19)*params(7)+y(22)*params(8))+y(26);
residual(10)= lhs-rhs;
lhs =y(22);
rhs =y(13)*(1-params(3))+params(3)*(y(27)-params(10)*(y(15)-y(16)));
residual(11)= lhs-rhs;
lhs =y(18);
rhs =y(19)+params(3)/(1-params(3))*(y(16)-y(1));
residual(12)= lhs-rhs;
lhs =y(31);
rhs =1/params(1)*y(9)+params(3)*(y(14)+y(16))-params(3)*(y(15)+y(27)-params(10)*(y(15)-y(16)));
residual(13)= lhs-rhs;
lhs =y(30);
rhs =y(18)+y(16)-y(1)-y(34);
residual(14)= lhs-rhs;
lhs =y(32);
rhs =y(27)-params(10)*(y(15)-y(16));
residual(15)= lhs-rhs;
lhs =y(35);
rhs =params(3)*(y(15)+y(32)-y(16)-y(14));
residual(16)= lhs-rhs;
lhs =y(24);
rhs =params(11)*y(3)+x(it_, 1);
residual(17)= lhs-rhs;
lhs =y(25);
rhs =params(12)*y(4)+x(it_, 2);
residual(18)= lhs-rhs;
lhs =y(26);
rhs =params(13)*y(5)+x(it_, 3);
residual(19)= lhs-rhs;
lhs =y(27);
rhs =params(14)*y(6)+x(it_, 4);
residual(20)= lhs-rhs;
lhs =y(33);
rhs =params(16)*y(10)+x(it_, 5);
residual(21)= lhs-rhs;
lhs =y(34);
rhs =params(17)*y(11)+x(it_, 6);
residual(22)= lhs-rhs;
lhs =y(28);
rhs =params(18)*y(7)+x(it_, 7);
residual(23)= lhs-rhs;
lhs =y(29);
rhs =params(19)*y(8)+x(it_, 8);
residual(24)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(24, 48);

  %
  % Jacobian matrix
  %

  g1(1,12)=(-1);
  g1(1,13)=1;
  g1(1,15)=params(4);
  g1(2,12)=(-1);
  g1(2,14)=1;
  g1(2,16)=params(4);
  g1(3,15)=(-(1-params(3)));
  g1(3,16)=(-params(3));
  g1(4,12)=1;
  g1(4,36)=(-1);
  g1(4,17)=params(2);
  g1(4,38)=(-params(2));
  g1(4,25)=(-(params(2)*(1-params(12))));
  g1(5,16)=1;
  g1(5,37)=(-1);
  g1(5,17)=1;
  g1(5,38)=(-1);
  g1(5,28)=(-1);
  g1(5,31)=(-params(15));
  g1(5,33)=(-1);
  g1(5,40)=1;
  g1(6,12)=(-(1/params(2)));
  g1(6,20)=(-params(5));
  g1(6,21)=1;
  g1(7,20)=(-1);
  g1(7,22)=1;
  g1(7,24)=(-1);
  g1(8,15)=T75;
  g1(8,19)=1;
  g1(8,39)=(-params(1));
  g1(8,23)=(-T75);
  g1(8,29)=(-1);
  g1(9,21)=(-1);
  g1(9,23)=1;
  g1(9,24)=1;
  g1(10,2)=(-params(9));
  g1(10,17)=1;
  g1(10,19)=(-((1-params(9))*params(7)));
  g1(10,22)=(-((1-params(9))*params(8)));
  g1(10,26)=(-1);
  g1(11,13)=(-(1-params(3)));
  g1(11,15)=(-(params(3)*(-params(10))));
  g1(11,16)=(-(params(3)*params(10)));
  g1(11,22)=1;
  g1(11,27)=(-params(3));
  g1(12,1)=params(3)/(1-params(3));
  g1(12,16)=(-(params(3)/(1-params(3))));
  g1(12,18)=1;
  g1(12,19)=(-1);
  g1(13,14)=(-params(3));
  g1(13,15)=params(3)*(1-params(10));
  g1(13,16)=(-(params(3)-params(3)*params(10)));
  g1(13,27)=params(3);
  g1(13,9)=(-(1/params(1)));
  g1(13,31)=1;
  g1(14,1)=1;
  g1(14,16)=(-1);
  g1(14,18)=(-1);
  g1(14,30)=1;
  g1(14,34)=1;
  g1(15,15)=params(10);
  g1(15,16)=(-params(10));
  g1(15,27)=(-1);
  g1(15,32)=1;
  g1(16,14)=params(3);
  g1(16,15)=(-params(3));
  g1(16,16)=params(3);
  g1(16,32)=(-params(3));
  g1(16,35)=1;
  g1(17,3)=(-params(11));
  g1(17,24)=1;
  g1(17,41)=(-1);
  g1(18,4)=(-params(12));
  g1(18,25)=1;
  g1(18,42)=(-1);
  g1(19,5)=(-params(13));
  g1(19,26)=1;
  g1(19,43)=(-1);
  g1(20,6)=(-params(14));
  g1(20,27)=1;
  g1(20,44)=(-1);
  g1(21,10)=(-params(16));
  g1(21,33)=1;
  g1(21,45)=(-1);
  g1(22,11)=(-params(17));
  g1(22,34)=1;
  g1(22,46)=(-1);
  g1(23,7)=(-params(18));
  g1(23,28)=1;
  g1(23,47)=(-1);
  g1(24,8)=(-params(19));
  g1(24,29)=1;
  g1(24,48)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],24,2304);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],24,110592);
end
end
end
end
