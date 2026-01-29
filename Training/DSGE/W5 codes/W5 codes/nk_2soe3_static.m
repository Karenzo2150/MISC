function [residual, g1, g2, g3] = nk_2soe3_static(y, x, params)
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

residual = zeros( 40, 1);

%
% Model equations
%

T147 = (1-params(6))*(1-params(1)*params(6))/params(6);
lhs =y(27);
rhs =y(26)-params(4)*y(29);
residual(1)= lhs-rhs;
lhs =y(28);
rhs =y(26)-params(4)*y(30);
residual(2)= lhs-rhs;
lhs =0;
rhs =y(29)*(1-params(3))+y(30)*params(3);
residual(3)= lhs-rhs;
lhs =y(26);
rhs =y(26)+(-params(2))*(y(31)-y(32))+params(2)*y(14)*(1-params(12));
residual(4)= lhs-rhs;
lhs =y(31)-y(32);
rhs =y(30)+y(22)-y(23)-y(30)+params(15)*y(38)+y(17);
residual(5)= lhs-rhs;
lhs =y(34);
rhs =params(5)*y(33)+y(26)*1/params(2);
residual(6)= lhs-rhs;
lhs =y(35);
rhs =y(33)+y(13);
residual(7)= lhs-rhs;
lhs =0;
rhs =y(36)-y(29);
residual(8)= lhs-rhs;
lhs =y(36);
rhs =y(34)-y(13);
residual(9)= lhs-rhs;
lhs =y(35);
rhs =y(27)*(1-params(3))+params(3)*(y(16)-params(10)*(y(29)-y(30)));
residual(10)= lhs-rhs;
residual(11) = y(32);
lhs =y(38);
rhs =y(38)*1/params(1)+params(3)*(y(28)+y(30))-params(3)*(y(29)+y(16)-params(10)*(y(29)-y(30)));
residual(12)= lhs-rhs;
lhs =y(37);
rhs =y(32)-y(23);
residual(13)= lhs-rhs;
lhs =y(39);
rhs =y(16)-params(10)*(y(29)-y(30));
residual(14)= lhs-rhs;
lhs =y(40);
rhs =params(3)*(y(29)+y(39)-y(30)-y(28));
residual(15)= lhs-rhs;
lhs =y(2);
rhs =y(1)-params(4)*y(4);
residual(16)= lhs-rhs;
lhs =y(3);
rhs =y(1)-params(4)*y(5);
residual(17)= lhs-rhs;
lhs =0;
rhs =(1-params(3))*y(4)+params(3)*y(5);
residual(18)= lhs-rhs;
lhs =y(1);
rhs =params(2)*y(14)*(1-params(12))+y(1)+(-params(2))*(y(6)-y(7));
residual(19)= lhs-rhs;
lhs =y(6)-y(7);
rhs =y(17)+y(22)-y(23)+y(5)-y(5)+params(15)*y(20);
residual(20)= lhs-rhs;
lhs =y(10);
rhs =params(5)*y(9)+1/params(2)*y(1);
residual(21)= lhs-rhs;
lhs =y(11);
rhs =y(13)+y(9);
residual(22)= lhs-rhs;
lhs =y(8);
rhs =params(1)*y(8)+T147*(y(12)-y(4))+y(18);
residual(23)= lhs-rhs;
lhs =y(12);
rhs =y(10)-y(13);
residual(24)= lhs-rhs;
residual(25) = y(19);
lhs =y(11);
rhs =(1-params(3))*y(2)+params(3)*(y(16)-params(10)*(y(4)-y(5)));
residual(26)= lhs-rhs;
lhs =y(7);
rhs =y(8);
residual(27)= lhs-rhs;
lhs =y(20);
rhs =1/params(1)*y(20)+params(3)*(y(3)+y(5))-params(3)*(y(16)+y(4)-params(10)*(y(4)-y(5)));
residual(28)= lhs-rhs;
lhs =y(19);
rhs =y(7)-y(23);
residual(29)= lhs-rhs;
lhs =y(21);
rhs =y(16)-params(10)*(y(4)-y(5));
residual(30)= lhs-rhs;
lhs =y(24);
rhs =params(3)*(y(4)+y(21)-y(5)-y(3));
residual(31)= lhs-rhs;
lhs =y(13);
rhs =y(13)*params(11)+x(1);
residual(32)= lhs-rhs;
lhs =y(14);
rhs =y(14)*params(12)+x(2);
residual(33)= lhs-rhs;
lhs =y(15);
rhs =y(15)*params(13)+x(3);
residual(34)= lhs-rhs;
lhs =y(16);
rhs =y(16)*params(14)+x(4);
residual(35)= lhs-rhs;
lhs =y(22);
rhs =y(22)*params(16)+x(5);
residual(36)= lhs-rhs;
lhs =y(23);
rhs =y(23)*params(17)+x(6);
residual(37)= lhs-rhs;
lhs =y(17);
rhs =y(17)*params(18)+x(7);
residual(38)= lhs-rhs;
lhs =y(18);
rhs =y(18)*params(19)+x(8);
residual(39)= lhs-rhs;
lhs =y(25);
rhs =y(11)-y(35);
residual(40)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(40, 40);

  %
  % Jacobian matrix
  %

  g1(1,26)=(-1);
  g1(1,27)=1;
  g1(1,29)=params(4);
  g1(2,26)=(-1);
  g1(2,28)=1;
  g1(2,30)=params(4);
  g1(3,29)=(-(1-params(3)));
  g1(3,30)=(-params(3));
  g1(4,14)=(-(params(2)*(1-params(12))));
  g1(4,31)=params(2);
  g1(4,32)=(-params(2));
  g1(5,17)=(-1);
  g1(5,22)=(-1);
  g1(5,23)=1;
  g1(5,31)=1;
  g1(5,32)=(-1);
  g1(5,38)=(-params(15));
  g1(6,26)=(-(1/params(2)));
  g1(6,33)=(-params(5));
  g1(6,34)=1;
  g1(7,13)=(-1);
  g1(7,33)=(-1);
  g1(7,35)=1;
  g1(8,29)=1;
  g1(8,36)=(-1);
  g1(9,13)=1;
  g1(9,34)=(-1);
  g1(9,36)=1;
  g1(10,16)=(-params(3));
  g1(10,27)=(-(1-params(3)));
  g1(10,29)=(-(params(3)*(-params(10))));
  g1(10,30)=(-(params(3)*params(10)));
  g1(10,35)=1;
  g1(11,32)=1;
  g1(12,16)=params(3);
  g1(12,28)=(-params(3));
  g1(12,29)=params(3)*(1-params(10));
  g1(12,30)=(-(params(3)-params(3)*params(10)));
  g1(12,38)=1-1/params(1);
  g1(13,23)=1;
  g1(13,32)=(-1);
  g1(13,37)=1;
  g1(14,16)=(-1);
  g1(14,29)=params(10);
  g1(14,30)=(-params(10));
  g1(14,39)=1;
  g1(15,28)=params(3);
  g1(15,29)=(-params(3));
  g1(15,30)=params(3);
  g1(15,39)=(-params(3));
  g1(15,40)=1;
  g1(16,1)=(-1);
  g1(16,2)=1;
  g1(16,4)=params(4);
  g1(17,1)=(-1);
  g1(17,3)=1;
  g1(17,5)=params(4);
  g1(18,4)=(-(1-params(3)));
  g1(18,5)=(-params(3));
  g1(19,6)=params(2);
  g1(19,7)=(-params(2));
  g1(19,14)=(-(params(2)*(1-params(12))));
  g1(20,6)=1;
  g1(20,7)=(-1);
  g1(20,17)=(-1);
  g1(20,20)=(-params(15));
  g1(20,22)=(-1);
  g1(20,23)=1;
  g1(21,1)=(-(1/params(2)));
  g1(21,9)=(-params(5));
  g1(21,10)=1;
  g1(22,9)=(-1);
  g1(22,11)=1;
  g1(22,13)=(-1);
  g1(23,4)=T147;
  g1(23,8)=1-params(1);
  g1(23,12)=(-T147);
  g1(23,18)=(-1);
  g1(24,10)=(-1);
  g1(24,12)=1;
  g1(24,13)=1;
  g1(25,19)=1;
  g1(26,2)=(-(1-params(3)));
  g1(26,4)=(-(params(3)*(-params(10))));
  g1(26,5)=(-(params(3)*params(10)));
  g1(26,11)=1;
  g1(26,16)=(-params(3));
  g1(27,7)=1;
  g1(27,8)=(-1);
  g1(28,3)=(-params(3));
  g1(28,4)=params(3)*(1-params(10));
  g1(28,5)=(-(params(3)-params(3)*params(10)));
  g1(28,16)=params(3);
  g1(28,20)=1-1/params(1);
  g1(29,7)=(-1);
  g1(29,19)=1;
  g1(29,23)=1;
  g1(30,4)=params(10);
  g1(30,5)=(-params(10));
  g1(30,16)=(-1);
  g1(30,21)=1;
  g1(31,3)=params(3);
  g1(31,4)=(-params(3));
  g1(31,5)=params(3);
  g1(31,21)=(-params(3));
  g1(31,24)=1;
  g1(32,13)=1-params(11);
  g1(33,14)=1-params(12);
  g1(34,15)=1-params(13);
  g1(35,16)=1-params(14);
  g1(36,22)=1-params(16);
  g1(37,23)=1-params(17);
  g1(38,17)=1-params(18);
  g1(39,18)=1-params(19);
  g1(40,11)=(-1);
  g1(40,25)=1;
  g1(40,35)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],40,1600);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],40,64000);
end
end
end
end
