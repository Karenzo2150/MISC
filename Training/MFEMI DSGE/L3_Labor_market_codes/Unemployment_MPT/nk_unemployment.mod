%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% INTERNATIONAL MONETARY FUND - Instutite for Capacity Development
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Off-Site Technical Assistance on Monetary and Fiscal Policy Analysis with DSGE Models
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Central Bank of Jordan
%% Jordan 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% August 10 – September 17, 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This file generates the simulation for the benchmark New-Keynesian model:
%% ... closed economy
%% ... unemployment a la Monacelli-Perotti-Trigari
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Contacts
%% Felipe Zanna: FZanna@IMF.org
%% Ivy Sabuga: ISabuga@IMF.org
%% Daniel Baksa: DBaksa2@IMF.org
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Endogenous variable %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Total GDP
Y

%% Consumption 
C

%% Gov. cons 
G

%% Marginal cost
MC 

%% MRS 
MRS 

%% Inflation
PI 

%% Real wage
W

%% Hiring probability
P

%% Hiring probability
Q

%% Labor tightness
OMEGA

%% Level of employment
L 

%% Level of unemployment
U 

%% Level of vacancy
V

%% Nominal interest rate
INT 
    
%% Real interest rate
R 

%% Persistent productivity shock
A 

%% Persistent preference shock
XI_C 

%% Persistent cost-push shock
XI_PI 

%% Persistent monetary policy shock
XI_INT



;

      
varexo 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Structural shocks %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Productivity shock
EPS_A 

%% Preference shock
EPS_C 

%% Gov. demand shock
EPS_G

%% Cost-push shock
EPS_PI 

%% Monetary policy shock
EPS_INT
;

parameters 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Structural parameters %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Households preferences
SIGMA, VARPHI, BETA, PSI

%% Price setting coefficients
PHI_P, EPSILON 

%% Labor market conditions
ETA, RHO, KAPPA, GAMMA, GAMMA_M 

%% Monetary policy reaction
PHI_PI, PHI_Y
           
%% Autoregressive coefficents
RHO_C, RHO_PI, RHO_A, RHO_INT, RHO_G

%% Steady-state values/calibration

Y_STEADY, C_STEADY, G_STEADY, L_STEADY, U_STEADY, V_STEADY, P_STEADY, Q_STEADY
W_STEADY, OMEGA_STEADY, INT_STEADY, R_STEADY
A_STEADY, PI_STEADY, MC_STEADY
;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Setting the values for parameters %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Households preferences
BETA  = 0.995;
SIGMA   = 2;
VARPHI     = 1;
PSI = 1;
G_STEADY = 0; 0.2;

% Price setting coefficients
% PHI_P   = 75;
EPSILON  = 6;
THETA_CALVO   = 0.75;

PHI_P=(EPSILON-1)/((1-THETA_CALVO)*(1-BETA*THETA_CALVO)/THETA_CALVO);


% Labor market conditions
RHO = 0.965;
ETA = 0.5;
GAMMA_M = 0.4;
GAMMA = 0.5;
KAPPA = 0.075;
A_STEADY = 1;

% Monetary policy reaction
PHI_PI   = 2.5;
PHI_Y   = 0;

% Autoregressive coefficents
RHO_C   = 0.85;
RHO_PI   = 0.75;
RHO_A   = 0.9;
RHO_INT   = 0.85;
RHO_G   = 0.9;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Steady-state calculations: additional step, Dynare calls external function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The hiring probability can be calculated numerically, but it is needed
% for the rest of the steady-state calculations
nk_unemployment_steady_state;
load('ss_vec','ss_vec');

% As we know the probability, the rest can be given easily
OMEGA_STEADY = ss_vec;
INT_STEADY = 1/BETA-1;
R_STEADY = 1/BETA-1;
PI_STEADY = 0;
MC_STEADY = (EPSILON-1)/EPSILON;
A_STEADY = 1;

Q_STEADY = GAMMA_M*OMEGA_STEADY^(-GAMMA);
P_STEADY = GAMMA_M*OMEGA_STEADY^(1-GAMMA);

W_STEADY = MC_STEADY*A_STEADY+(1/(1+R_STEADY))*RHO*(KAPPA/Q_STEADY)-KAPPA/Q_STEADY;
U_STEADY = 1 / (1+Q_STEADY*OMEGA_STEADY/(1-RHO));
V_STEADY = OMEGA_STEADY*U_STEADY;
L_STEADY = Q_STEADY*V_STEADY/(1-RHO);
Y_STEADY = A_STEADY*L_STEADY;
C_STEADY = Y_STEADY-G_STEADY;
MRS_STEADY = PSI*(L_STEADY^VARPHI)/(C_STEADY^(-SIGMA));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

model;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Model equations (the model is non-linear!!) %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 1. Aggregate Demand, Dynamic IS curve
C^(-SIGMA) = BETA*(C(+1)^(-SIGMA))*((1+INT)/(1+PI(+1)))*(exp(XI_C(+1))/exp(XI_C));

%% 2. MRS condition
MRS = PSI*(L^VARPHI)/(C^(-SIGMA));

%% 3. Labor demand function
KAPPA/Q  = MC*A-W+(1/(1+R))*RHO*(KAPPA/Q(+1));

%% 4. Production function 
Y = A*L;

%% 5. Aggregate Supply, New-Keynesian Phillips curve (non-linear version)
(EPSILON/(EPSILON-1))*MC+(PHI_P/(EPSILON-1))*XI_PI+(1/(1+R))*(PHI_P/(EPSILON-1))*Y(+1)/Y*PI(+1)*(1+PI(+1))=1+(PHI_P/(EPSILON-1))*PI*(1+PI);

%% 6.Flow of employment
L = RHO*L(-1)+Q*V;

%% 7. Unemployment
U = 1-L(-1);

%% 8. Labor market equilibrium
KAPPA/Q  = (1-ETA)*(MC*A-MRS)+(1/(1+R))*(RHO-ETA*P(+1))*(KAPPA/Q(+1));

%% 9. Tightness
OMEGA = V/U;

%% 10. Hiring probability
Q = GAMMA_M*OMEGA^(-GAMMA);

%% 11. Job finding probability
P = GAMMA_M*OMEGA^(1-GAMMA);

%% 12. Taylor rule:
1+INT = (1/BETA)*((1+PI)^PHI_PI)*((Y/Y_STEADY)^(PHI_Y))*EXP(XI_INT);

%% 13. Fisher identity
1+INT = (1+R)*(1+PI(+1));

%% 14. Good market equilibrium
Y = C + G;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Shocks 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 15. Productivity shock, trend shock
A = RHO_A*A(-1)+(1-RHO_A)*A_STEADY+EPS_A*A_STEADY;

%% 16. Aggregate Demand shock
XI_C = RHO_C*XI_C(-1)+EPS_C;

%% 17. Aggregate Supply shock, Cost-push shock
XI_PI = RHO_PI*XI_PI(-1)+EPS_PI;

%% 18. Monetary policy shock
XI_INT = RHO_INT*XI_INT(-1)+EPS_INT;

%% 19. Monetary policy shock
G = RHO_G*G(-1)+(1-RHO_G)*G_STEADY+EPS_G;

end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Defining initial (steady-state) values %%%%%%%%%%%%%%%%%%
%%%%%% based on the external calculations %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

initval;
Y = Y_STEADY;
C = C_STEADY;
G = G_STEADY;
L = L_STEADY;
U = U_STEADY;
V = V_STEADY;
W = W_STEADY;
MC = MC_STEADY;
P = P_STEADY;
Q = Q_STEADY;
OMEGA = OMEGA_STEADY;
INT = INT_STEADY;
R = R_STEADY;
A = A_STEADY;
PI = PI_STEADY;
MRS = MRS_STEADY;
end; 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Checking the steady-state and stability conditions %%%%%%
%%%%%% It is crucial to have precise steady-state, otherwise %%%
%%%%%% the linear approximation generates weird IRFs %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

steady;
check;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setting the std of shocks %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

shocks;
var EPS_A; stderr 0.01;
var EPS_C; stderr 0.01;
var EPS_PI; stderr 0.01;
var EPS_INT; stderr 0.01;
var EPS_G; stderr 0.01;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Stochastic simulation %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

stoch_simul(irf=20, order=1, nograph);

