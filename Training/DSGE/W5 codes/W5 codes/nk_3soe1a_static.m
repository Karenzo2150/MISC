function [residual, g1, g2, g3] = nk_3soe1a_static(y, x, params)
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

residual = zeros( 25, 1);

%
% Model equations
%

T72 = (1-params(6))*(1-params(1)*params(6))/params(6);
lhs =y(2);
rhs =y(1)-params(4)*y(4);
residual(1)= lhs-rhs;
lhs =y(3);
rhs =y(1)-params(4)*y(5);
residual(2)= lhs-rhs;
lhs =0;
rhs =y(4)*(1-params(3))+y(5)*params(3);
residual(3)= lhs-rhs;
lhs =y(1);
rhs =y(1)+(-params(2))*(y(6)-y(7))+params(2)*y(14)*(1-params(12));
residual(4)= lhs-rhs;
lhs =y(6)-y(7);
rhs =y(5)+y(22)-y(23)-y(5)+params(15)*y(20)+y(17);
residual(5)= lhs-rhs;
lhs =y(10);
rhs =params(5)*y(9)+y(1)*1/params(2);
residual(6)= lhs-rhs;
lhs =y(11);
rhs =y(9)+y(13);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(1)+T72*(y(12)-y(4))+y(18);
residual(8)= lhs-rhs;
lhs =y(12);
rhs =y(10)-y(13);
residual(9)= lhs-rhs;
lhs =y(6);
rhs =y(6)*params(7)+(1-params(7))*(y(7)*params(8)+y(11)*params(9))+y(15);
residual(10)= lhs-rhs;
lhs =y(11);
rhs =y(2)*(1-params(3))+params(3)*(y(16)-params(10)*(y(4)-y(5)));
residual(11)= lhs-rhs;
lhs =y(7);
rhs =y(8);
residual(12)= lhs-rhs;
lhs =y(20)-y(25);
rhs =(y(20)-y(25))*1/params(1)+params(3)*(y(3)+y(5))-params(3)*(y(4)+y(16)-params(10)*(y(4)-y(5)));
residual(13)= lhs-rhs;
lhs =y(19);
rhs =y(7)-y(23);
residual(14)= lhs-rhs;
lhs =y(21);
rhs =y(16)-params(10)*(y(4)-y(5));
residual(15)= lhs-rhs;
lhs =y(24);
rhs =params(3)*(y(4)+y(21)-y(5)-y(3));
residual(16)= lhs-rhs;
lhs =y(13);
rhs =y(13)*params(11)+x(1);
residual(17)= lhs-rhs;
lhs =y(14);
rhs =y(14)*params(12)+x(2);
residual(18)= lhs-rhs;
lhs =y(15);
rhs =y(15)*params(13)+x(3);
residual(19)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(14)+x(4);
residual(20)= lhs-rhs;
lhs =y(22);
rhs =y(22)*params(16)+x(5);
residual(21)= lhs-rhs;
lhs =y(23);
rhs =y(23)*params(17)+x(6);
residual(22)= lhs-rhs;
lhs =y(17);
rhs =y(17)*params(18)+x(7);
residual(23)= lhs-rhs;
lhs =y(18);
rhs =y(18)*params(19)+x(8);
residual(24)= lhs-rhs;
lhs =y(25);
rhs =y(25)*params(20)+x(9);
residual(25)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(25, 25);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-1);
  g1(1,2)=1;
  g1(1,4)=params(4);
  g1(2,1)=(-1);
  g1(2,3)=1;
  g1(2,5)=params(4);
  g1(3,4)=(-(1-params(3)));
  g1(3,5)=(-params(3));
  g1(4,6)=params(2);
  g1(4,7)=(-params(2));
  g1(4,14)=(-(params(2)*(1-params(12))));
  g1(5,6)=1;
  g1(5,7)=(-1);
  g1(5,17)=(-1);
  g1(5,20)=(-params(15));
  g1(5,22)=(-1);
  g1(5,23)=1;
  g1(6,1)=(-(1/params(2)));
  g1(6,9)=(-params(5));
  g1(6,10)=1;
  g1(7,9)=(-1);
  g1(7,11)=1;
  g1(7,13)=(-1);
  g1(8,4)=T72;
  g1(8,8)=1-params(1);
  g1(8,12)=(-T72);
  g1(8,18)=(-1);
  g1(9,10)=(-1);
  g1(9,12)=1;
  g1(9,13)=1;
  g1(10,6)=1-params(7);
  g1(10,7)=(-((1-params(7))*params(8)));
  g1(10,11)=(-((1-params(7))*params(9)));
  g1(10,15)=(-1);
  g1(11,2)=(-(1-params(3)));
  g1(11,4)=(-(params(3)*(-params(10))));
  g1(11,5)=(-(params(3)*params(10)));
  g1(11,11)=1;
  g1(11,16)=(-params(3));
  g1(12,7)=1;
  g1(12,8)=(-1);
  g1(13,3)=(-params(3));
  g1(13,4)=params(3)*(1-params(10));
  g1(13,5)=(-(params(3)-params(3)*params(10)));
  g1(13,16)=params(3);
  g1(13,20)=1-1/params(1);
  g1(13,25)=(-1)-(-(1/params(1)));
  g1(14,7)=(-1);
  g1(14,19)=1;
  g1(14,23)=1;
  g1(15,4)=params(10);
  g1(15,5)=(-params(10));
  g1(15,16)=(-1);
  g1(15,21)=1;
  g1(16,3)=params(3);
  g1(16,4)=(-params(3));
  g1(16,5)=params(3);
  g1(16,21)=(-params(3));
  g1(16,24)=1;
  g1(17,13)=1-params(11);
  g1(18,14)=1-params(12);
  g1(19,15)=1-params(13);
  g1(20,16)=1-params(14);
  g1(21,22)=1-params(16);
  g1(22,23)=1-params(17);
  g1(23,17)=1-params(18);
  g1(24,18)=1-params(19);
  g1(25,25)=1-params(20);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],25,625);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],25,15625);
end
end
end
end
