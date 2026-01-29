function [residual, g1, g2, g3] = basic_nk_dynamic(y, x, params, steady_state, it_)
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
T11 = 1/params(1);
T35 = params(1)+(params(2)+params(5))/(1-params(5));
lhs =y(5);
rhs =y(18)-T11*(y(9)-y(19)-y(11));
residual(1)= lhs-rhs;
lhs =y(8);
rhs =params(7)*y(6)+y(19)*params(3)+y(16);
residual(2)= lhs-rhs;
lhs =y(6);
rhs =y(5)*T35;
residual(3)= lhs-rhs;
lhs =y(9);
rhs =y(8)*params(8)+y(5)*params(9)+y(17);
residual(4)= lhs-rhs;
lhs =T35*y(10);
rhs =(1+params(2))/(1-params(5))*y(14);
residual(5)= lhs-rhs;
lhs =y(10);
rhs =y(20)-T11*y(11)+T11*(y(15)-y(21));
residual(6)= lhs-rhs;
lhs =y(12);
rhs =y(5)+y(10);
residual(7)= lhs-rhs;
lhs =y(14);
rhs =params(12)*y(1)+x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(15);
rhs =params(10)*y(2)+x(it_, 2);
residual(9)= lhs-rhs;
lhs =y(16);
rhs =params(11)*y(3)+x(it_, 3);
residual(10)= lhs-rhs;
lhs =y(17);
rhs =params(13)*y(4)+x(it_, 4);
residual(11)= lhs-rhs;
lhs =y(6);
rhs =y(7)-y(14);
residual(12)= lhs-rhs;
lhs =y(12);
rhs =y(14)+y(13);
residual(13)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(13, 25);

  %
  % Jacobian matrix
  %

  g1(1,5)=1;
  g1(1,18)=(-1);
  g1(1,19)=(-T11);
  g1(1,9)=T11;
  g1(1,11)=(-T11);
  g1(2,6)=(-params(7));
  g1(2,8)=1;
  g1(2,19)=(-params(3));
  g1(2,16)=(-1);
  g1(3,5)=(-T35);
  g1(3,6)=1;
  g1(4,5)=(-params(9));
  g1(4,8)=(-params(8));
  g1(4,9)=1;
  g1(4,17)=(-1);
  g1(5,10)=T35;
  g1(5,14)=(-((1+params(2))/(1-params(5))));
  g1(6,10)=1;
  g1(6,20)=(-1);
  g1(6,11)=T11;
  g1(6,15)=(-T11);
  g1(6,21)=T11;
  g1(7,5)=(-1);
  g1(7,10)=(-1);
  g1(7,12)=1;
  g1(8,1)=(-params(12));
  g1(8,14)=1;
  g1(8,22)=(-1);
  g1(9,2)=(-params(10));
  g1(9,15)=1;
  g1(9,23)=(-1);
  g1(10,3)=(-params(11));
  g1(10,16)=1;
  g1(10,24)=(-1);
  g1(11,4)=(-params(13));
  g1(11,17)=1;
  g1(11,25)=(-1);
  g1(12,6)=1;
  g1(12,7)=(-1);
  g1(12,14)=1;
  g1(13,12)=1;
  g1(13,13)=(-1);
  g1(13,14)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],13,625);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],13,15625);
end
end
end
end
