function [residual, g1, g2, g3] = nk_closedv1_est_cons_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(13, 1);
lhs =y(5);
rhs =(-params(2))*(y(6)-y(19))+y(18)+params(2)*(1-params(10))*y(13);
residual(1)= lhs-rhs;
lhs =y(9);
rhs =params(3)*y(8)+y(5)*1/params(2);
residual(2)= lhs-rhs;
lhs =y(10);
rhs =y(8)+y(12);
residual(3)= lhs-rhs;
lhs =y(7);
rhs =y(19)*params(1)+(1-params(4))*(1-params(1)*params(4))/params(4)*y(11);
residual(4)= lhs-rhs;
lhs =y(11);
rhs =y(9)-y(12);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(7)*params(5)+y(10)*params(6)+y(14);
residual(6)= lhs-rhs;
lhs =y(10);
rhs =y(5);
residual(7)= lhs-rhs;
lhs =y(12);
rhs =params(9)*y(2)+x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(13);
rhs =params(10)*y(3)+x(it_, 2);
residual(9)= lhs-rhs;
lhs =y(14);
rhs =params(11)*y(4)+x(it_, 3);
residual(10)= lhs-rhs;
lhs =y(15);
rhs =params(7)+params(8)-400*log(params(1))+y(6)*400;
residual(11)= lhs-rhs;
lhs =y(16);
rhs =params(7)+y(7)*400;
residual(12)= lhs-rhs;
lhs =y(17);
rhs =params(8)+400*(y(10)-y(1));
residual(13)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(13, 22);

  %
  % Jacobian matrix
  %

  g1(1,5)=1;
  g1(1,18)=(-1);
  g1(1,6)=params(2);
  g1(1,19)=(-params(2));
  g1(1,13)=(-(params(2)*(1-params(10))));
  g1(2,5)=(-(1/params(2)));
  g1(2,8)=(-params(3));
  g1(2,9)=1;
  g1(3,8)=(-1);
  g1(3,10)=1;
  g1(3,12)=(-1);
  g1(4,7)=1;
  g1(4,19)=(-params(1));
  g1(4,11)=(-((1-params(4))*(1-params(1)*params(4))/params(4)));
  g1(5,9)=(-1);
  g1(5,11)=1;
  g1(5,12)=1;
  g1(6,6)=1;
  g1(6,7)=(-params(5));
  g1(6,10)=(-params(6));
  g1(6,14)=(-1);
  g1(7,5)=(-1);
  g1(7,10)=1;
  g1(8,2)=(-params(9));
  g1(8,12)=1;
  g1(8,20)=(-1);
  g1(9,3)=(-params(10));
  g1(9,13)=1;
  g1(9,21)=(-1);
  g1(10,4)=(-params(11));
  g1(10,14)=1;
  g1(10,22)=(-1);
  g1(11,6)=(-400);
  g1(11,15)=1;
  g1(12,7)=(-400);
  g1(12,16)=1;
  g1(13,1)=400;
  g1(13,10)=(-400);
  g1(13,17)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],13,484);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],13,10648);
end
end
end
end
