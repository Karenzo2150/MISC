function [residual, g1, g2, g3] = nk_closed_est_dynamic(y, x, params, steady_state, it_)
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
lhs =y(6);
rhs =(-params(2))*(y(7)-y(20))+y(19)+params(2)*y(14)*(1-params(10));
residual(1)= lhs-rhs;
lhs =y(10);
rhs =params(3)*y(9)+y(6)*1/params(2);
residual(2)= lhs-rhs;
lhs =y(11);
rhs =y(9)+y(13);
residual(3)= lhs-rhs;
lhs =y(8);
rhs =y(20)*params(1)+(1-params(4))*(1-params(1)*params(4))/params(4)*y(12);
residual(4)= lhs-rhs;
lhs =y(12);
rhs =y(10)-y(13);
residual(5)= lhs-rhs;
lhs =y(7);
rhs =params(12)*y(1)+(1-params(12))*(y(8)*params(5)+y(11)*params(6))+y(15);
residual(6)= lhs-rhs;
lhs =y(11);
rhs =y(6);
residual(7)= lhs-rhs;
lhs =y(13);
rhs =params(9)*y(3)+x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(14);
rhs =params(10)*y(4)+x(it_, 2);
residual(9)= lhs-rhs;
lhs =y(15);
rhs =params(11)*y(5)+x(it_, 3);
residual(10)= lhs-rhs;
lhs =y(16);
rhs =params(7)+params(8)-400*log(params(1))+y(7)*400;
residual(11)= lhs-rhs;
lhs =y(17);
rhs =params(7)+y(8)*400;
residual(12)= lhs-rhs;
lhs =y(18);
rhs =params(8)+400*(y(11)-y(2));
residual(13)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(13, 23);

  %
  % Jacobian matrix
  %

  g1(1,6)=1;
  g1(1,19)=(-1);
  g1(1,7)=params(2);
  g1(1,20)=(-params(2));
  g1(1,14)=(-(params(2)*(1-params(10))));
  g1(2,6)=(-(1/params(2)));
  g1(2,9)=(-params(3));
  g1(2,10)=1;
  g1(3,9)=(-1);
  g1(3,11)=1;
  g1(3,13)=(-1);
  g1(4,8)=1;
  g1(4,20)=(-params(1));
  g1(4,12)=(-((1-params(4))*(1-params(1)*params(4))/params(4)));
  g1(5,10)=(-1);
  g1(5,12)=1;
  g1(5,13)=1;
  g1(6,1)=(-params(12));
  g1(6,7)=1;
  g1(6,8)=(-((1-params(12))*params(5)));
  g1(6,11)=(-((1-params(12))*params(6)));
  g1(6,15)=(-1);
  g1(7,6)=(-1);
  g1(7,11)=1;
  g1(8,3)=(-params(9));
  g1(8,13)=1;
  g1(8,21)=(-1);
  g1(9,4)=(-params(10));
  g1(9,14)=1;
  g1(9,22)=(-1);
  g1(10,5)=(-params(11));
  g1(10,15)=1;
  g1(10,23)=(-1);
  g1(11,7)=(-400);
  g1(11,16)=1;
  g1(12,8)=(-400);
  g1(12,17)=1;
  g1(13,2)=400;
  g1(13,11)=(-400);
  g1(13,18)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],13,529);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],13,12167);
end
end
end
end
