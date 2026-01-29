function [residual, g1, g2, g3] = basic_nk_static(y, x, params)
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

T10 = 1/params(1);
T33 = params(1)+(params(2)+params(5))/(1-params(5));
lhs =y(1);
rhs =y(1)-T10*(y(5)-y(4)-y(7));
residual(1)= lhs-rhs;
lhs =y(4);
rhs =params(7)*y(2)+y(4)*params(3)+y(12);
residual(2)= lhs-rhs;
lhs =y(2);
rhs =y(1)*T33;
residual(3)= lhs-rhs;
lhs =y(5);
rhs =y(4)*params(8)+y(1)*params(9)+y(13);
residual(4)= lhs-rhs;
lhs =T33*y(6);
rhs =(1+params(2))/(1-params(5))*y(10);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(6)-T10*y(7);
residual(6)= lhs-rhs;
lhs =y(8);
rhs =y(1)+y(6);
residual(7)= lhs-rhs;
lhs =y(10);
rhs =y(10)*params(12)+x(1);
residual(8)= lhs-rhs;
lhs =y(11);
rhs =y(11)*params(10)+x(2);
residual(9)= lhs-rhs;
lhs =y(12);
rhs =y(12)*params(11)+x(3);
residual(10)= lhs-rhs;
lhs =y(13);
rhs =y(13)*params(13)+x(4);
residual(11)= lhs-rhs;
lhs =y(2);
rhs =y(3)-y(10);
residual(12)= lhs-rhs;
lhs =y(8);
rhs =y(10)+y(9);
residual(13)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(13, 13);

  %
  % Jacobian matrix
  %

  g1(1,4)=(-T10);
  g1(1,5)=T10;
  g1(1,7)=(-T10);
  g1(2,2)=(-params(7));
  g1(2,4)=1-params(3);
  g1(2,12)=(-1);
  g1(3,1)=(-T33);
  g1(3,2)=1;
  g1(4,1)=(-params(9));
  g1(4,4)=(-params(8));
  g1(4,5)=1;
  g1(4,13)=(-1);
  g1(5,6)=T33;
  g1(5,10)=(-((1+params(2))/(1-params(5))));
  g1(6,7)=T10;
  g1(7,1)=(-1);
  g1(7,6)=(-1);
  g1(7,8)=1;
  g1(8,10)=1-params(12);
  g1(9,11)=1-params(10);
  g1(10,12)=1-params(11);
  g1(11,13)=1-params(13);
  g1(12,2)=1;
  g1(12,3)=(-1);
  g1(12,10)=1;
  g1(13,8)=1;
  g1(13,9)=(-1);
  g1(13,10)=(-1);
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
