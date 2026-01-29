function [residual, g1, g2, g3] = nk_closed_est_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 13, 1);

%
% Model equations
%

lhs =y(1);
rhs =y(1)+(-params(2))*(y(2)-y(3))+params(2)*y(9)*(1-params(10));
residual(1)= lhs-rhs;
lhs =y(5);
rhs =params(3)*y(4)+y(1)*1/params(2);
residual(2)= lhs-rhs;
lhs =y(6);
rhs =y(4)+y(8);
residual(3)= lhs-rhs;
lhs =y(3);
rhs =y(3)*params(1)+(1-params(4))*(1-params(1)*params(4))/params(4)*y(7);
residual(4)= lhs-rhs;
lhs =y(7);
rhs =y(5)-y(8);
residual(5)= lhs-rhs;
lhs =y(2);
rhs =y(2)*params(12)+(1-params(12))*(y(3)*params(5)+y(6)*params(6))+y(10);
residual(6)= lhs-rhs;
lhs =y(6);
rhs =y(1);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(9)+x(1);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =y(9)*params(10)+x(2);
residual(9)= lhs-rhs;
lhs =y(10);
rhs =y(10)*params(11)+x(3);
residual(10)= lhs-rhs;
lhs =y(11);
rhs =params(7)+params(8)-400*log(params(1))+y(2)*400;
residual(11)= lhs-rhs;
lhs =y(12);
rhs =params(7)+y(3)*400;
residual(12)= lhs-rhs;
lhs =y(13);
rhs =params(8);
residual(13)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(13, 13);

  %
  % Jacobian matrix
  %

  g1(1,2)=params(2);
  g1(1,3)=(-params(2));
  g1(1,9)=(-(params(2)*(1-params(10))));
  g1(2,1)=(-(1/params(2)));
  g1(2,4)=(-params(3));
  g1(2,5)=1;
  g1(3,4)=(-1);
  g1(3,6)=1;
  g1(3,8)=(-1);
  g1(4,3)=1-params(1);
  g1(4,7)=(-((1-params(4))*(1-params(1)*params(4))/params(4)));
  g1(5,5)=(-1);
  g1(5,7)=1;
  g1(5,8)=1;
  g1(6,2)=1-params(12);
  g1(6,3)=(-((1-params(12))*params(5)));
  g1(6,6)=(-((1-params(12))*params(6)));
  g1(6,10)=(-1);
  g1(7,1)=(-1);
  g1(7,6)=1;
  g1(8,8)=1-params(9);
  g1(9,9)=1-params(10);
  g1(10,10)=1-params(11);
  g1(11,2)=(-400);
  g1(11,11)=1;
  g1(12,3)=(-400);
  g1(12,12)=1;
  g1(13,13)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],13,169);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],13,2197);
end
end
end
end
