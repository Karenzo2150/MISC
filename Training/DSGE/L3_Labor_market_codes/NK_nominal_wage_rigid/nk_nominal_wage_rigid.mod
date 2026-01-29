%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% INTERNATIONAL MONETARY FUND - Instutite for Capacity Development
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Off-Site Technical Assistance on Monetary and Fiscal Policy Analysis with DSGE Models
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ministry of Finance
%% Israel 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% August 10 – September 17, 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This file generates the simulation for the benchmark New-Keynesian model:
%% ... closed economy
%% ... nominal wage rigidity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Contacts
%% Felipe Zanna: FZanna@IMF.org
%% Daniel Baksa: DBaksa2@IMF.org
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Endogenous variable %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Output gap
X 

%% Real wage gap
X_W 

%% Marginal cost
MC 

%% Inflation
PI 

%% Nominal wage inflation
PI_W

%% Nominal interest rate
INT 

%% Neutral GDP level
YN 

%% Neutral real interest rate
RN 

%% Total GDP
Y
    
%% Persistent productivity shock
A 

%% Persistent labor supply shock
PSI

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

%% Labor supply shock
EPS_PSI

%% Preference shock
EPS_C 

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
SIGMA, VARPHI, BETA 

%% Price setting coefficients
THETA, EPSILON, KAPPA 

%% Wage setting coefficients
THETA_W, EPSILON_W, KAPPA_W 

%% Monetary policy reaction
PHI_PI, PHI_X
           
%% Autoregressive coefficents
RHO_C, RHO_PI, RHO_A, RHO_INT, RHO_PSI
;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Setting the values for parameters %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Households preferences
BETA  = 0.995;
SIGMA   = 2;
VARPHI     = 1;

% Price setting coefficients
THETA   = 0.75;
EPSILON = 6;
KAPPA   = ((1-THETA)*(1-BETA*THETA)/THETA);

% Wage setting coefficients
THETA_W = 0.75;
EPSILON_W = 6;
KAPPA_W   = ((1-THETA_W)*(1-BETA*THETA_W)/(THETA_W*(1+EPSILON_W*VARPHI)));

% Monetary policy reaction
PHI_PI   = 2.5;
PHI_X   = 0;0.5;

% Autoregressive coefficents
RHO_C   = 0.85;
RHO_PI   = 0.75;
RHO_A   = 0.9;
RHO_INT   = 0.85;
RHO_PSI = 0.8;


model(linear);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Model equations %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Gaps and cyclical components
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 1. Aggregate Demand, Dynamic IS curve
X = X(+1)-(1/SIGMA)*(INT-PI(+1)-RN);

%% 2. Aggregate Supply, New-Keynesian Phillips curve
PI = KAPPA*MC+BETA*PI(+1)+XI_PI;

%% 3. Marginal cost
MC = X_W;

%% 4. New-Keynesian Nominal Wage Phillips curve
PI_W = KAPPA_W*(PSI+(SIGMA+VARPHI)*X-X_W)+BETA*PI_W(+1);

%% 5. Wage Inflation:
PI_W = PI + A-A(-1)+X_W-X_W(-1);

%% 6. Taylor-rule
INT = PHI_PI*PI+PHI_X*X+XI_INT;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Natural levels
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 7. Natural level of production
(SIGMA+VARPHI)*YN = (1+VARPHI)*A;

%% 8. Natural rate of interest
YN = YN(+1)-(1/SIGMA)*RN+(1/SIGMA)*(XI_C-XI_C(+1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Total 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 9. Total GDP:
Y = X + YN;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Shocks 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 10. Productivity shock, trend shock
A = RHO_A*A(-1)+EPS_A;

%% 11. Aggregate Demand shock
XI_C = RHO_C*XI_C(-1)+EPS_C;

%% 12. Aggregate Supply shock, Cost-push shock
XI_PI = RHO_PI*XI_PI(-1)+EPS_PI;

%% 13. Monetary policy shock
XI_INT = RHO_INT*XI_INT(-1)+EPS_INT;

%% 14. Labor supply shock
PSI = RHO_PSI*PSI(-1)+EPS_PSI;

end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% Checking the steady-state and stability conditions %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

steady;
check;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Setting the std of shocks %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

shocks;
var EPS_A; stderr 1;
var EPS_C; stderr 1;
var EPS_PI; stderr 1;
var EPS_INT; stderr 1;
var EPS_PSI; stderr 1;
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Stochastic simulation %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

stoch_simul(irf=20, nograph);
