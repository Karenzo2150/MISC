function [residual, g1, g2, g3] = NKMGasto_GHH_Inves_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(15, 1);
cr1__ = exp(y(12))/(exp(y(1))^params(8)*params(10)^(1-params(8)));
cr2__ = exp(y(23))/(params(10)^(1-params(8))*exp(y(12))^params(8));
sinv__ = 0.5*params(14)*(exp(y(15))/exp(y(2))-1)^2;
dsinv__ = exp(y(15))/exp(y(2))*params(14)*(exp(y(15))/exp(y(2))-1);
dsinvP__ = params(14)*(exp(y(24))/exp(y(15))-1)*(exp(y(24))/exp(y(15)))^2;
T56 = exp(y(7))-params(3)/(1+params(2))*exp(y(8))^(1+params(2));
T90 = params(4)*exp(y(21))/exp(y(6));
T145 = exp(y(23))*cr2__*T90*params(7)*(cr2__-1)*exp(y(22))/exp(y(10));
T153 = exp(y(10))*params(7)/2;
T156 = exp(y(10))*(1-exp(y(13)))-T153*(cr1__-1)^2;
T161 = exp(y(20))*exp(y(8))^(1-params(15));
T162 = exp(y(3))^params(15);
T181 = params(11)*(exp(y(12))/params(10))^params(12)*exp(x(it_, 2));
lhs =exp(y(6));
rhs =T56^(-params(1));
residual(1)= lhs-rhs;
lhs =exp(y(6));
rhs =params(4)*exp(y(21))*exp(y(11))/exp(y(23));
residual(2)= lhs-rhs;
lhs =params(3)*exp(y(8))^params(2);
rhs =exp(y(9));
residual(3)= lhs-rhs;
lhs =exp(y(16));
rhs =(1-params(16))*exp(y(3))+exp(y(15))*(1-sinv__);
residual(4)= lhs-rhs;
lhs =exp(y(17));
rhs =T90*(exp(y(26))+(1-params(16))*exp(y(25)));
residual(5)= lhs-rhs;
lhs =1;
rhs =exp(y(17))*(1-sinv__-exp(y(15))*dsinv__)-T90*exp(y(24))*exp(y(25))*dsinvP__;
residual(6)= lhs-rhs;
lhs =exp(y(9));
rhs =(1-params(15))*exp(y(13))*exp(y(10))/exp(y(8));
residual(7)= lhs-rhs;
lhs =exp(y(18));
rhs =exp(y(10))*params(15)*exp(y(13))/exp(y(3));
residual(8)= lhs-rhs;
lhs =0;
rhs =1-params(9)+exp(y(13))*params(9)-cr1__*exp(y(12))*params(7)*(cr1__-1)+T145;
residual(9)= lhs-rhs;
lhs =exp(y(14));
rhs =T156;
residual(10)= lhs-rhs;
lhs =exp(y(10));
rhs =T161*T162;
residual(11)= lhs-rhs;
lhs =exp(y(15))+exp(y(7))+exp(y(19));
rhs =exp(y(14))+exp(y(8))*exp(y(9))+exp(y(3))*exp(y(18));
residual(12)= lhs-rhs;
lhs =exp(y(11));
rhs =T181;
residual(13)= lhs-rhs;
lhs =y(19);
rhs =params(6)*y(4)+(1-params(6))*log(params(5))+x(it_, 1);
residual(14)= lhs-rhs;
lhs =y(20);
rhs =(1-params(13))*log(params(27))+params(13)*y(5)+x(it_, 3);
residual(15)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(15, 29);

  %
  % Jacobian matrix
  %

T16 = params(10)^(1-params(8));
T17 = exp(y(1))^params(8)*T16;
T22 = T16*exp(y(12))^params(8);
T31 = exp(y(15))/exp(y(2));
T39 = exp(y(24))/exp(y(15));
T42 = T39^2;
T209 = params(4)*(-(exp(y(6))*exp(y(21))))/(exp(y(6))*exp(y(6)));
T225 = getPowerDeriv(T56,(-params(1)),1);
T249 = (-((1-params(15))*exp(y(13))*exp(y(10))/exp(y(8))));
T263 = (-(exp(y(12))*T16*exp(y(1))*getPowerDeriv(exp(y(1)),params(8),1)))/(T17*T17);
T285 = (-(exp(y(23))*T16*exp(y(12))*getPowerDeriv(exp(y(12)),params(8),1)))/(T22*T22);
T326 = (-(exp(y(15))*exp(y(2))))/(exp(y(2))*exp(y(2)));
T330 = (-(0.5*params(14)*T326*2*(T31-1)));
T357 = (-(exp(y(15))*exp(y(24))))/(exp(y(15))*exp(y(15)));
  g1(1,6)=exp(y(6));
  g1(1,7)=(-(exp(y(7))*T225));
  g1(1,8)=(-(T225*(-(params(3)/(1+params(2))*exp(y(8))*getPowerDeriv(exp(y(8)),1+params(2),1)))));
  g1(2,6)=exp(y(6));
  g1(2,21)=(-(params(4)*exp(y(21))*exp(y(11))/exp(y(23))));
  g1(2,11)=(-(params(4)*exp(y(21))*exp(y(11))/exp(y(23))));
  g1(2,23)=(-(params(4)*exp(y(21))*(-(exp(y(23))*exp(y(11))))/(exp(y(23))*exp(y(23)))));
  g1(3,8)=params(3)*exp(y(8))*getPowerDeriv(exp(y(8)),params(2),1);
  g1(3,9)=(-exp(y(9)));
  g1(4,2)=(-(exp(y(15))*T330));
  g1(4,15)=(-(exp(y(15))*(1-sinv__)+exp(y(15))*(-(0.5*params(14)*T31*2*(T31-1)))));
  g1(4,3)=(-((1-params(16))*exp(y(3))));
  g1(4,16)=exp(y(16));
  g1(5,6)=(-((exp(y(26))+(1-params(16))*exp(y(25)))*T209));
  g1(5,21)=(-(T90*(exp(y(26))+(1-params(16))*exp(y(25)))));
  g1(5,17)=exp(y(17));
  g1(5,25)=(-(T90*(1-params(16))*exp(y(25))));
  g1(5,26)=(-(T90*exp(y(26))));
  g1(6,6)=exp(y(24))*exp(y(25))*dsinvP__*T209;
  g1(6,21)=T90*exp(y(24))*exp(y(25))*dsinvP__;
  g1(6,2)=(-(exp(y(17))*(T330-exp(y(15))*(params(14)*(T31-1)*T326+T31*params(14)*T326))));
  g1(6,15)=(-(exp(y(17))*((-(0.5*params(14)*T31*2*(T31-1)))-(exp(y(15))*dsinv__+exp(y(15))*(T31*params(14)*(T31-1)+T31*params(14)*T31)))-T90*exp(y(24))*exp(y(25))*(T42*params(14)*T357+params(14)*(T39-1)*T357*2*T39)));
  g1(6,24)=T90*(exp(y(24))*exp(y(25))*dsinvP__+exp(y(24))*exp(y(25))*(T42*params(14)*T39+params(14)*(T39-1)*T39*2*T39));
  g1(6,17)=(-(exp(y(17))*(1-sinv__-exp(y(15))*dsinv__)));
  g1(6,25)=T90*exp(y(24))*exp(y(25))*dsinvP__;
  g1(7,8)=(-((-(exp(y(8))*(1-params(15))*exp(y(13))*exp(y(10))))/(exp(y(8))*exp(y(8)))));
  g1(7,9)=exp(y(9));
  g1(7,10)=T249;
  g1(7,13)=T249;
  g1(8,10)=(-(exp(y(10))*params(15)*exp(y(13))/exp(y(3))));
  g1(8,13)=(-(exp(y(10))*params(15)*exp(y(13))/exp(y(3))));
  g1(8,3)=(-((-(exp(y(3))*exp(y(10))*params(15)*exp(y(13))))/(exp(y(3))*exp(y(3)))));
  g1(8,18)=exp(y(18));
  g1(9,6)=(-(exp(y(22))*exp(y(23))*cr2__*(cr2__-1)*params(7)*T209/exp(y(10))));
  g1(9,21)=(-T145);
  g1(9,10)=(-((-(exp(y(10))*exp(y(23))*cr2__*T90*params(7)*(cr2__-1)*exp(y(22))))/(exp(y(10))*exp(y(10)))));
  g1(9,22)=(-T145);
  g1(9,1)=exp(y(12))*params(7)*(cr1__-1)*T263+cr1__*exp(y(12))*params(7)*T263;
  g1(9,12)=(-((-(exp(y(12))/T17*exp(y(12))*params(7)*(cr1__-1)+cr1__*(exp(y(12))*params(7)*(cr1__-1)+exp(y(12))/T17*exp(y(12))*params(7))))+exp(y(22))*exp(y(23))*(T90*params(7)*(cr2__-1)*T285+cr2__*T90*params(7)*T285)/exp(y(10))));
  g1(9,23)=(-(exp(y(22))*(exp(y(23))*cr2__*T90*params(7)*(cr2__-1)+exp(y(23))*(exp(y(23))/T22*T90*params(7)*(cr2__-1)+cr2__*exp(y(23))/T22*T90*params(7)))/exp(y(10))));
  g1(9,13)=(-(exp(y(13))*params(9)));
  g1(10,10)=(-T156);
  g1(10,1)=T153*T263*2*(cr1__-1);
  g1(10,12)=T153*exp(y(12))/T17*2*(cr1__-1);
  g1(10,13)=(-(exp(y(10))*(-exp(y(13)))));
  g1(10,14)=exp(y(14));
  g1(11,8)=(-(T162*exp(y(20))*exp(y(8))*getPowerDeriv(exp(y(8)),1-params(15),1)));
  g1(11,10)=exp(y(10));
  g1(11,3)=(-(T161*exp(y(3))*getPowerDeriv(exp(y(3)),params(15),1)));
  g1(11,20)=(-(T161*T162));
  g1(12,7)=exp(y(7));
  g1(12,8)=(-(exp(y(8))*exp(y(9))));
  g1(12,9)=(-(exp(y(8))*exp(y(9))));
  g1(12,14)=(-exp(y(14)));
  g1(12,15)=exp(y(15));
  g1(12,3)=(-(exp(y(3))*exp(y(18))));
  g1(12,18)=(-(exp(y(3))*exp(y(18))));
  g1(12,19)=exp(y(19));
  g1(13,11)=exp(y(11));
  g1(13,12)=(-(exp(x(it_, 2))*params(11)*exp(y(12))/params(10)*getPowerDeriv(exp(y(12))/params(10),params(12),1)));
  g1(13,28)=(-T181);
  g1(14,4)=(-params(6));
  g1(14,19)=1;
  g1(14,27)=(-1);
  g1(15,5)=(-params(13));
  g1(15,20)=1;
  g1(15,29)=(-1);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],15,841);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],15,24389);
end
end
end
end
