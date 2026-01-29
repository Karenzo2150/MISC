function [residual, g1, g2, g3] = nkm_Gali_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(18, 1);
Omega__ = (1-params(1))/(1-params(1)+params(1)*params(11));
psi_n_ya__ = (1+params(7))/(params(1)+params(7)+(1-params(1))*params(6));
lambda__ = (1-params(12))*(1-params(12)*params(2))/params(12)*Omega__;
kappa__ = lambda__*(params(6)+(params(1)+params(7))/(1-params(1)));
T45 = (-1)/params(6);
lhs =y(7);
rhs =params(2)*y(25)+kappa__*y(8)+y(24);
residual(1)= lhs-rhs;
lhs =y(8);
rhs =T45*(y(13)-y(25)-y(11))+y(26);
residual(2)= lhs-rhs;
lhs =y(13);
rhs =y(7)*params(8)+y(8)*params(9)+y(17);
residual(3)= lhs-rhs;
lhs =y(11);
rhs =(-params(6))*psi_n_ya__*(1-params(3))*y(18)+(1-params(5))*y(23);
residual(4)= lhs-rhs;
lhs =y(12);
rhs =y(13)-y(25);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =psi_n_ya__*y(18);
residual(6)= lhs-rhs;
lhs =y(8);
rhs =y(10)-y(9);
residual(7)= lhs-rhs;
lhs =y(17);
rhs =params(4)*y(3)+x(it_, 2);
residual(8)= lhs-rhs;
lhs =y(18);
rhs =params(3)*y(4)+x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(10);
rhs =y(18)+(1-params(1))*y(14);
residual(10)= lhs-rhs;
lhs =y(23);
rhs =params(5)*y(5)+x(it_, 3);
residual(11)= lhs-rhs;
lhs =y(16);
rhs =4*(y(7)+y(10)-y(1)-params(10)*(y(13)-y(2)));
residual(12)= lhs-rhs;
lhs =y(15);
rhs =y(10)-y(13)*params(10);
residual(13)= lhs-rhs;
lhs =y(20);
rhs =y(13)*4;
residual(14)= lhs-rhs;
lhs =y(19);
rhs =y(12)*4;
residual(15)= lhs-rhs;
lhs =y(21);
rhs =y(11)*4;
residual(16)= lhs-rhs;
lhs =y(22);
rhs =y(7)*4;
residual(17)= lhs-rhs;
lhs =y(24);
rhs =params(14)*y(6)+x(it_, 4);
residual(18)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(18, 30);

  %
  % Jacobian matrix
  %

  g1(1,7)=1;
  g1(1,25)=(-params(2));
  g1(1,8)=(-kappa__);
  g1(1,24)=(-1);
  g1(2,25)=T45;
  g1(2,8)=1;
  g1(2,26)=(-1);
  g1(2,11)=T45;
  g1(2,13)=(-T45);
  g1(3,7)=(-params(8));
  g1(3,8)=(-params(9));
  g1(3,13)=1;
  g1(3,17)=(-1);
  g1(4,11)=1;
  g1(4,18)=(-((-params(6))*psi_n_ya__*(1-params(3))));
  g1(4,23)=(-(1-params(5)));
  g1(5,25)=1;
  g1(5,12)=1;
  g1(5,13)=(-1);
  g1(6,9)=1;
  g1(6,18)=(-psi_n_ya__);
  g1(7,8)=1;
  g1(7,9)=1;
  g1(7,10)=(-1);
  g1(8,3)=(-params(4));
  g1(8,17)=1;
  g1(8,28)=(-1);
  g1(9,4)=(-params(3));
  g1(9,18)=1;
  g1(9,27)=(-1);
  g1(10,10)=1;
  g1(10,14)=(-(1-params(1)));
  g1(10,18)=(-1);
  g1(11,5)=(-params(5));
  g1(11,23)=1;
  g1(11,29)=(-1);
  g1(12,7)=(-4);
  g1(12,1)=4;
  g1(12,10)=(-4);
  g1(12,2)=(-(4*params(10)));
  g1(12,13)=(-(4*(-params(10))));
  g1(12,16)=1;
  g1(13,10)=(-1);
  g1(13,13)=params(10);
  g1(13,15)=1;
  g1(14,13)=(-4);
  g1(14,20)=1;
  g1(15,12)=(-4);
  g1(15,19)=1;
  g1(16,11)=(-4);
  g1(16,21)=1;
  g1(17,7)=(-4);
  g1(17,22)=1;
  g1(18,6)=(-params(14));
  g1(18,24)=1;
  g1(18,30)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],18,900);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],18,27000);
end
end
end
end
