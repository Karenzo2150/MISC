function [residual, g1, g2, g3] = rbc_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(9, 1);
T40 = exp(y(3))*y(2)^params(1);
T42 = y(6)^(1-params(1));
T43 = T40*T42;
lhs =(1+params(5))/y(5);
rhs =params(6)*1/y(12)*(1+y(13)-params(2));
residual(1)= lhs-rhs;
lhs =y(5)*params(7)/((1-params(7))*(1-y(6)));
rhs =y(9);
residual(2)= lhs-rhs;
lhs =y(8);
rhs =y(5)+y(7);
residual(3)= lhs-rhs;
lhs =y(8);
rhs =T43;
residual(4)= lhs-rhs;
lhs =(1+params(5))*(1+params(8))*y(4);
rhs =y(7)+y(2)*(1-params(2));
residual(5)= lhs-rhs;
lhs =y(9);
rhs =y(8)*(1-params(1))/y(6);
residual(6)= lhs-rhs;
lhs =y(10);
rhs =y(8)*params(1)/y(2);
residual(7)= lhs-rhs;
lhs =y(3);
rhs =params(3)*y(1)+x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(11);
rhs =y(8)/y(6);
residual(9)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(9, 14);

  %
  % Jacobian matrix
  %

  g1(1,5)=(-(1+params(5)))/(y(5)*y(5));
  g1(1,12)=(-((1+y(13)-params(2))*params(6)*(-1)/(y(12)*y(12))));
  g1(1,13)=(-(params(6)*1/y(12)));
  g1(2,5)=params(7)/((1-params(7))*(1-y(6)));
  g1(2,6)=(-(y(5)*params(7)*(-(1-params(7)))))/((1-params(7))*(1-y(6))*(1-params(7))*(1-y(6)));
  g1(2,9)=(-1);
  g1(3,5)=(-1);
  g1(3,7)=(-1);
  g1(3,8)=1;
  g1(4,3)=(-T43);
  g1(4,2)=(-(T42*exp(y(3))*getPowerDeriv(y(2),params(1),1)));
  g1(4,6)=(-(T40*getPowerDeriv(y(6),1-params(1),1)));
  g1(4,8)=1;
  g1(5,2)=(-(1-params(2)));
  g1(5,4)=(1+params(5))*(1+params(8));
  g1(5,7)=(-1);
  g1(6,6)=(-((-(y(8)*(1-params(1))))/(y(6)*y(6))));
  g1(6,8)=(-((1-params(1))/y(6)));
  g1(6,9)=1;
  g1(7,2)=(-((-(y(8)*params(1)))/(y(2)*y(2))));
  g1(7,8)=(-(params(1)/y(2)));
  g1(7,10)=1;
  g1(8,1)=(-params(3));
  g1(8,3)=1;
  g1(8,14)=(-1);
  g1(9,6)=(-((-y(8))/(y(6)*y(6))));
  g1(9,8)=(-(1/y(6)));
  g1(9,11)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],9,196);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],9,2744);
end
end
end
end
