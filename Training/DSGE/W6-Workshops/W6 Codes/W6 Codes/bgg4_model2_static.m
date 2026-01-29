function [residual, g1, g2, g3] = bgg4_model2_static(y, x, params)
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

residual = zeros( 38, 1);

%
% Model equations
%

T122 = params(47)/params(2);
T156 = (1-params(26))*(1-params(2)*params(26))/params(26)/(1+params(2)*params(27));
T181 = (-params(3))*(1-params(4))/(1+params(4));
T236 = 1/params(3)*1/(1-params(4));
T240 = 1/params(3)*params(4)/(1-params(4));
T261 = (1-params(24))*(1-params(2)*params(24))/params(24)/(1+params(2)*params(25));
T313 = (1-params(21))*(1-params(2)*params(21))/(params(21)*(1+params(5)*params(23)));
lhs =params(42)*y(20);
rhs =((1-params(36))*params(48)+(1-params(35))*params(13))*y(21)+params(49)*y(22)+params(8)*y(9);
residual(1)= lhs-rhs;
lhs =((1-params(36))*params(48)+(1-params(35))*params(13))*y(21);
rhs =(1-params(36))*params(19)*y(1)+(1-params(36))*params(18)*y(14)-(1-params(36))*(params(19)+params(18))*params(37)*y(25)+(1-params(35))*params(13)*(y(11)-params(38)*(y(25)-y(26)));
residual(2)= lhs-rhs;
lhs =y(22);
rhs =y(38)-params(39)*(y(25)-y(28));
residual(3)= lhs-rhs;
lhs =params(43)*y(23);
rhs =y(1)*params(36)*params(19)+y(14)*params(36)*params(18)-params(37)*params(36)*(params(19)+params(18))*y(31)+params(35)*params(13)*(y(11)-params(38)*(y(31)-y(26)));
residual(4)= lhs-rhs;
lhs =params(44)*y(24);
rhs =params(49)*y(22)+params(40)*y(37);
residual(5)= lhs-rhs;
lhs =params(44)*y(27);
rhs =params(49)*y(25)+params(40)*(y(28)+y(36));
residual(6)= lhs-rhs;
lhs =y(28);
rhs =y(28)+y(29)+y(35)-y(3);
residual(7)= lhs-rhs;
lhs =y(25);
rhs =y(25)+y(33)-y(3);
residual(8)= lhs-rhs;
lhs =y(2);
rhs =y(29)+y(34)+params(46)*y(30);
residual(9)= lhs-rhs;
lhs =params(47)*(y(28)+y(30));
rhs =T122*(y(28)+y(34)+y(30)*(1+params(46))-y(35))+params(43)*(y(28)+y(23))+params(40)*params(45)*(y(37)+y(28)+y(36))-params(44)*(y(24)+y(27));
residual(10)= lhs-rhs;
lhs =y(32);
rhs =y(32)*params(2)/(1+params(2)*params(27))+y(32)*params(27)/(1+params(2)*params(27))+T156*(y(28)-y(31));
residual(11)= lhs-rhs;
lhs =y(31);
rhs =y(31)+y(32)-y(3);
residual(12)= lhs-rhs;
lhs =y(26);
rhs =(1-params(35))*y(25)+params(35)*y(31);
residual(13)= lhs-rhs;
lhs =0;
rhs =(1-params(36))*y(25)+params(36)*y(31);
residual(14)= lhs-rhs;
lhs =y(6);
rhs =params(42)*y(20)+params(40)*y(37);
residual(15)= lhs-rhs;
lhs =y(1);
rhs =T181*(y(2)-y(3))+y(1)*1/(1+params(4))+y(1)*params(4)/(1+params(4));
residual(16)= lhs-rhs;
lhs =y(14);
rhs =y(13);
residual(17)= lhs-rhs;
lhs =y(15)-(y(29)+y(34)-y(3));
rhs =params(1)*y(17);
residual(18)= lhs-rhs;
lhs =y(17);
rhs =params(1)*params(20)*(y(16)+y(12)-y(13));
residual(19)= lhs-rhs;
lhs =y(15);
rhs =(1-params(12))*(y(20)+y(7)-y(12))+y(16)*params(12)-y(16);
residual(20)= lhs-rhs;
residual(21) = y(16)-y(26);
lhs =y(20);
rhs =y(8)+y(12)*params(6)+(1-params(6))*y(4);
residual(22)= lhs-rhs;
lhs =y(18);
rhs =y(4)*params(5)+y(1)*T236-y(1)*T240;
residual(23)= lhs-rhs;
lhs =y(5);
rhs =y(20)+y(7)-y(4);
residual(24)= lhs-rhs;
lhs =y(33);
rhs =y(33)*params(2)/(1+params(2)*params(25))+y(33)*params(25)/(1+params(2)*params(25))+T261*(y(7)-y(25));
residual(25)= lhs-rhs;
lhs =y(12);
rhs =y(11)*params(7)+y(12)*(1-params(7));
residual(26)= lhs-rhs;
lhs =y(13);
rhs =params(1)*(y(13)+y(15)*params(14)-(params(14)-1)*(y(29)+y(34)+y(17)-y(3)));
residual(27)= lhs-rhs;
lhs =y(2);
rhs =y(2)*params(28)+y(3)*(1-params(28))*params(29)+y(6)*(1-params(28))*params(30)+y(29)*(1-params(28))*params(31)+y(10);
residual(28)= lhs-rhs;
lhs =y(19);
rhs =y(3)*params(22)+T313*(y(18)-y(5))+params(2)*y(19)-y(3)*params(2)*params(22);
residual(29)= lhs-rhs;
lhs =y(19);
rhs =y(3);
residual(30)= lhs-rhs;
lhs =y(9);
rhs =y(9)*params(33)+x(2)*params(61);
residual(31)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(32)+x(1)*params(62);
residual(32)= lhs-rhs;
lhs =y(10);
rhs =y(10)*params(34)+x(3)*params(60);
residual(33)= lhs-rhs;
lhs =y(34);
rhs =y(34)*params(50)+x(4)*params(55);
residual(34)= lhs-rhs;
lhs =y(35);
rhs =y(35)*params(51)+x(5)*params(56);
residual(35)= lhs-rhs;
lhs =y(36);
rhs =y(36)*params(52)+x(6)*params(57);
residual(36)= lhs-rhs;
lhs =y(37);
rhs =y(37)*params(53)+x(7)*params(58);
residual(37)= lhs-rhs;
lhs =y(38);
rhs =y(38)*params(54)+x(8)*params(59);
residual(38)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(38, 38);

  %
  % Jacobian matrix
  %

  g1(1,9)=(-params(8));
  g1(1,20)=params(42);
  g1(1,21)=(-((1-params(36))*params(48)+(1-params(35))*params(13)));
  g1(1,22)=(-params(49));
  g1(2,1)=(-((1-params(36))*params(19)));
  g1(2,11)=(-((1-params(35))*params(13)));
  g1(2,14)=(-((1-params(36))*params(18)));
  g1(2,21)=(1-params(36))*params(48)+(1-params(35))*params(13);
  g1(2,25)=(-((-((1-params(36))*(params(19)+params(18))*params(37)))+(1-params(35))*params(13)*(-params(38))));
  g1(2,26)=(-((1-params(35))*params(13)*params(38)));
  g1(3,22)=1;
  g1(3,25)=params(39);
  g1(3,28)=(-params(39));
  g1(3,38)=(-1);
  g1(4,1)=(-(params(36)*params(19)));
  g1(4,11)=(-(params(35)*params(13)));
  g1(4,14)=(-(params(36)*params(18)));
  g1(4,23)=params(43);
  g1(4,26)=(-(params(38)*params(35)*params(13)));
  g1(4,31)=(-((-(params(37)*params(36)*(params(19)+params(18))))+params(35)*params(13)*(-params(38))));
  g1(5,22)=(-params(49));
  g1(5,24)=params(44);
  g1(5,37)=(-params(40));
  g1(6,25)=(-params(49));
  g1(6,27)=params(44);
  g1(6,28)=(-params(40));
  g1(6,36)=(-params(40));
  g1(7,3)=1;
  g1(7,29)=(-1);
  g1(7,35)=(-1);
  g1(8,3)=1;
  g1(8,33)=(-1);
  g1(9,2)=1;
  g1(9,29)=(-1);
  g1(9,30)=(-params(46));
  g1(9,34)=(-1);
  g1(10,23)=(-params(43));
  g1(10,24)=params(44);
  g1(10,27)=params(44);
  g1(10,28)=params(47)-(params(40)*params(45)+params(43)+T122);
  g1(10,30)=params(47)-T122*(1+params(46));
  g1(10,34)=(-T122);
  g1(10,35)=T122;
  g1(10,36)=(-(params(40)*params(45)));
  g1(10,37)=(-(params(40)*params(45)));
  g1(11,28)=(-T156);
  g1(11,31)=T156;
  g1(11,32)=1-(params(2)/(1+params(2)*params(27))+params(27)/(1+params(2)*params(27)));
  g1(12,3)=1;
  g1(12,32)=(-1);
  g1(13,25)=(-(1-params(35)));
  g1(13,26)=1;
  g1(13,31)=(-params(35));
  g1(14,25)=(-(1-params(36)));
  g1(14,31)=(-params(36));
  g1(15,6)=1;
  g1(15,20)=(-params(42));
  g1(15,37)=(-params(40));
  g1(16,1)=1-(1/(1+params(4))+params(4)/(1+params(4)));
  g1(16,2)=(-T181);
  g1(16,3)=T181;
  g1(17,13)=(-1);
  g1(17,14)=1;
  g1(18,3)=1;
  g1(18,15)=1;
  g1(18,17)=(-params(1));
  g1(18,29)=(-1);
  g1(18,34)=(-1);
  g1(19,12)=(-(params(1)*params(20)));
  g1(19,13)=params(1)*params(20);
  g1(19,16)=(-(params(1)*params(20)));
  g1(19,17)=1;
  g1(20,7)=(-(1-params(12)));
  g1(20,12)=1-params(12);
  g1(20,15)=1;
  g1(20,16)=(-(params(12)-1));
  g1(20,20)=(-(1-params(12)));
  g1(21,16)=1;
  g1(21,26)=(-1);
  g1(22,4)=(-(1-params(6)));
  g1(22,8)=(-1);
  g1(22,12)=(-params(6));
  g1(22,20)=1;
  g1(23,1)=(-(T236-T240));
  g1(23,4)=(-params(5));
  g1(23,18)=1;
  g1(24,4)=1;
  g1(24,5)=1;
  g1(24,7)=(-1);
  g1(24,20)=(-1);
  g1(25,7)=(-T261);
  g1(25,25)=T261;
  g1(25,33)=1-(params(2)/(1+params(2)*params(25))+params(25)/(1+params(2)*params(25)));
  g1(26,11)=(-params(7));
  g1(26,12)=1-(1-params(7));
  g1(27,3)=(-(params(1)*(params(14)-1)));
  g1(27,13)=1-params(1);
  g1(27,15)=(-(params(1)*params(14)));
  g1(27,17)=(-(params(1)*(-(params(14)-1))));
  g1(27,29)=(-(params(1)*(-(params(14)-1))));
  g1(27,34)=(-(params(1)*(-(params(14)-1))));
  g1(28,2)=1-params(28);
  g1(28,3)=(-((1-params(28))*params(29)));
  g1(28,6)=(-((1-params(28))*params(30)));
  g1(28,10)=(-1);
  g1(28,29)=(-((1-params(28))*params(31)));
  g1(29,3)=(-(params(22)-params(2)*params(22)));
  g1(29,5)=T313;
  g1(29,18)=(-T313);
  g1(29,19)=1-params(2);
  g1(30,3)=(-1);
  g1(30,19)=1;
  g1(31,9)=1-params(33);
  g1(32,8)=1-params(32);
  g1(33,10)=1-params(34);
  g1(34,34)=1-params(50);
  g1(35,35)=1-params(51);
  g1(36,36)=1-params(52);
  g1(37,37)=1-params(53);
  g1(38,38)=1-params(54);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],38,1444);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],38,54872);
end
end
end
end
