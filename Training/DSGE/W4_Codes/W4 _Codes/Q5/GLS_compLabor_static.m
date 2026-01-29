function [residual, g1, g2, g3] = GLS_compLabor_static(y, x, params)
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

residual = zeros( 26, 1);

%
% Model equations
%

cr1__ = exp(y(4))/params(8);
cr2__ = exp(y(4))/params(8);
sinv__ = 0;
dsinv__ = 0;
dsinvP__ = 0;
T11 = exp(y(4))/params(8);
T28 = exp(y(2))*params(1)*exp(y(3))/exp(y(4));
T122 = exp(y(3))^params(10);
T126 = params(15)*T11^params(9);
T128 = T126^(1-params(10));
T155 = exp(y(24))*exp(y(16))^params(6);
T156 = exp(y(17))^(1-params(6));
T190 = params(7)*0.5*exp(y(14))*(cr1__-1)^2;
lhs =1/exp(y(1));
rhs =exp(y(2));
residual(1)= lhs-rhs;
lhs =exp(y(2));
rhs =T28;
residual(2)= lhs-rhs;
lhs =exp(y(6));
rhs =params(1)*(exp(y(5))+exp(y(6))*(1-params(3)));
residual(3)= lhs-rhs;
lhs =1;
rhs =exp(y(6))*(1-sinv__-dsinv__)+params(1)*exp(y(6))*dsinvP__;
residual(4)= lhs-rhs;
lhs =exp(y(7));
rhs =(1-params(3))*exp(y(7))+exp(y(8))*(1-sinv__);
residual(5)= lhs-rhs;
lhs =params(5)*exp(y(10))^params(4);
rhs =exp(y(2))*exp(y(9));
residual(6)= lhs-rhs;
lhs =params(5)*exp(y(11))^params(4);
rhs =exp(y(9))*exp(y(15));
residual(7)= lhs-rhs;
lhs =1/exp(y(12));
rhs =exp(y(15));
residual(8)= lhs-rhs;
lhs =exp(y(12));
rhs =exp(y(9))*exp(y(11))-y(21);
residual(9)= lhs-rhs;
lhs =exp(y(9));
rhs =(1-params(6))*exp(y(13))*exp(y(14))/exp(y(17));
residual(10)= lhs-rhs;
lhs =exp(y(5));
rhs =exp(y(14))*params(6)*exp(y(13))/exp(y(16));
residual(11)= lhs-rhs;
lhs =0;
rhs =1-params(16)+exp(y(13))*params(16)-cr1__*exp(y(4))*params(7)*(cr1__-1)+exp(y(14))*exp(y(4))*cr2__*params(1)*params(7)*(cr2__-1)/exp(y(14));
residual(12)= lhs-rhs;
lhs =exp(y(3));
rhs =T122*T128*exp(y(23));
residual(13)= lhs-rhs;
lhs =exp(y(18));
rhs =exp(y(8))*(1-params(11));
residual(14)= lhs-rhs;
lhs =exp(y(16));
rhs =exp(y(7))*(1-params(11));
residual(15)= lhs-rhs;
lhs =exp(y(19));
rhs =exp(y(12))*params(11)+exp(y(1))*(1-params(11));
residual(16)= lhs-rhs;
lhs =exp(y(17));
rhs =exp(y(11))*params(11)+exp(y(10))*(1-params(11));
residual(17)= lhs-rhs;
lhs =exp(y(14));
rhs =T155*T156;
residual(18)= lhs-rhs;
lhs =y(20)+y(26);
rhs =y(25)+y(26)*exp(y(3))/exp(y(4));
residual(19)= lhs-rhs;
lhs =y(20);
rhs =(1-params(11))*y(22)+y(21)*params(11);
residual(20)= lhs-rhs;
lhs =y(21);
rhs =params(37)+params(19)*(y(26)-params(18))+params(19)*(y(25)-params(14));
residual(21)= lhs-rhs;
lhs =y(22);
rhs =params(36);
residual(22)= lhs-rhs;
lhs =exp(y(14));
rhs =y(25)+exp(y(18))+exp(y(19))+T190;
residual(23)= lhs-rhs;
lhs =y(25);
rhs =params(14)*(1-params(12))+y(25)*params(12)+x(1);
residual(24)= lhs-rhs;
lhs =y(24);
rhs =(1-params(13))*log(params(35))+y(24)*params(13)+x(2);
residual(25)= lhs-rhs;
lhs =y(23);
rhs =y(23)*params(17)+x(3);
residual(26)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(26, 26);

  %
  % Jacobian matrix
  %

T291 = (-((1-params(6))*exp(y(13))*exp(y(14))/exp(y(17))));
  g1(1,1)=(-exp(y(1)))/(exp(y(1))*exp(y(1)));
  g1(1,2)=(-exp(y(2)));
  g1(2,2)=exp(y(2))-T28;
  g1(2,3)=(-T28);
  g1(2,4)=(-((-(exp(y(4))*exp(y(2))*params(1)*exp(y(3))))/(exp(y(4))*exp(y(4)))));
  g1(3,5)=(-(params(1)*exp(y(5))));
  g1(3,6)=exp(y(6))-params(1)*exp(y(6))*(1-params(3));
  g1(4,6)=(-(exp(y(6))*(1-sinv__-dsinv__)+params(1)*exp(y(6))*dsinvP__));
  g1(5,7)=exp(y(7))-(1-params(3))*exp(y(7));
  g1(5,8)=(-(exp(y(8))*(1-sinv__)));
  g1(6,2)=(-(exp(y(2))*exp(y(9))));
  g1(6,9)=(-(exp(y(2))*exp(y(9))));
  g1(6,10)=params(5)*exp(y(10))*getPowerDeriv(exp(y(10)),params(4),1);
  g1(7,9)=(-(exp(y(9))*exp(y(15))));
  g1(7,11)=params(5)*exp(y(11))*getPowerDeriv(exp(y(11)),params(4),1);
  g1(7,15)=(-(exp(y(9))*exp(y(15))));
  g1(8,12)=(-exp(y(12)))/(exp(y(12))*exp(y(12)));
  g1(8,15)=(-exp(y(15)));
  g1(9,9)=(-(exp(y(9))*exp(y(11))));
  g1(9,11)=(-(exp(y(9))*exp(y(11))));
  g1(9,12)=exp(y(12));
  g1(9,21)=1;
  g1(10,9)=exp(y(9));
  g1(10,13)=T291;
  g1(10,14)=T291;
  g1(10,17)=(-((-((1-params(6))*exp(y(13))*exp(y(14))*exp(y(17))))/(exp(y(17))*exp(y(17)))));
  g1(11,5)=exp(y(5));
  g1(11,13)=(-(exp(y(14))*params(6)*exp(y(13))/exp(y(16))));
  g1(11,14)=(-(exp(y(14))*params(6)*exp(y(13))/exp(y(16))));
  g1(11,16)=(-((-(exp(y(14))*params(6)*exp(y(13))*exp(y(16))))/(exp(y(16))*exp(y(16)))));
  g1(12,4)=(-((-(T11*exp(y(4))*params(7)*(cr1__-1)+cr1__*(exp(y(4))*params(7)*(cr1__-1)+T11*exp(y(4))*params(7))))+exp(y(14))*(exp(y(4))*cr2__*params(1)*params(7)*(cr2__-1)+exp(y(4))*(T11*params(1)*params(7)*(cr2__-1)+cr2__*T11*params(1)*params(7)))/exp(y(14))));
  g1(12,13)=(-(exp(y(13))*params(16)));
  g1(13,3)=exp(y(3))-exp(y(23))*T128*exp(y(3))*getPowerDeriv(exp(y(3)),params(10),1);
  g1(13,4)=(-(exp(y(23))*T122*params(15)*T11*getPowerDeriv(T11,params(9),1)*getPowerDeriv(T126,1-params(10),1)));
  g1(13,23)=(-(T122*T128*exp(y(23))));
  g1(14,8)=(-(exp(y(8))*(1-params(11))));
  g1(14,18)=exp(y(18));
  g1(15,7)=(-(exp(y(7))*(1-params(11))));
  g1(15,16)=exp(y(16));
  g1(16,1)=(-(exp(y(1))*(1-params(11))));
  g1(16,12)=(-(exp(y(12))*params(11)));
  g1(16,19)=exp(y(19));
  g1(17,10)=(-(exp(y(10))*(1-params(11))));
  g1(17,11)=(-(exp(y(11))*params(11)));
  g1(17,17)=exp(y(17));
  g1(18,14)=exp(y(14));
  g1(18,16)=(-(T156*exp(y(24))*exp(y(16))*getPowerDeriv(exp(y(16)),params(6),1)));
  g1(18,17)=(-(T155*exp(y(17))*getPowerDeriv(exp(y(17)),1-params(6),1)));
  g1(18,24)=(-(T155*T156));
  g1(19,3)=(-(y(26)*exp(y(3))/exp(y(4))));
  g1(19,4)=(-(y(26)*(-(exp(y(4))*exp(y(3))))/(exp(y(4))*exp(y(4)))));
  g1(19,20)=1;
  g1(19,25)=(-1);
  g1(19,26)=1-exp(y(3))/exp(y(4));
  g1(20,20)=1;
  g1(20,21)=(-params(11));
  g1(20,22)=(-(1-params(11)));
  g1(21,21)=1;
  g1(21,25)=(-params(19));
  g1(21,26)=(-params(19));
  g1(22,22)=1;
  g1(23,4)=(-(params(7)*0.5*exp(y(14))*T11*2*(cr1__-1)));
  g1(23,14)=exp(y(14))-T190;
  g1(23,18)=(-exp(y(18)));
  g1(23,19)=(-exp(y(19)));
  g1(23,25)=(-1);
  g1(24,25)=1-params(12);
  g1(25,24)=1-params(13);
  g1(26,23)=1-params(17);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],26,676);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],26,17576);
end
end
end
end
