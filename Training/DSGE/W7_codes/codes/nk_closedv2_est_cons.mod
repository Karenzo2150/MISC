%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% INTERNATIONAL MONETARY FUND - Institute for Capacity Development
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Course on Monetary and Fiscal Policy Analysis with DSGE Models 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Joint Vienna Institute (JVI)
%% Vienna, Austria 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% September 29-October 10, 2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This file estimates the baseline NK model in the closed economy with US data (consistent)
%% Includes habit formation and price indexation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Contact
%% Pau Rabanal: PRabanal@IMF.org
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


var c rnom pic lab rw y mc a g z rnom_obs pic_obs y_obs;
varexo e_a e_g e_z;

parameters beta_C sigma h sigma_L theta_p chi_p phi_pic phi_y infl_ss growth_ss rho_a rho_g rho_z;

beta_C  = 0.995;
sigma   = 1;
h       = 0;
sigma_L = 1;
theta_p = 0.75;
chi_p   = 0;
phi_pic = 1.5;
phi_y   = 0.125;
infl_ss = 2;
growth_ss = 2;

rho_a   = 0.90;
rho_g   = 0.80;
rho_z   = 0.70;


model (linear);
// Model equations
c   = -(1-h)/(1+h)*sigma*(rnom-pic(+1)) + 1/(1+h)*c(+1) + h/(1+h)*c(-1) + (1-h)/(1+h)*sigma*(1-rho_g)*g;
rw  = sigma_L*lab + 1/(1-h)*(1/sigma)*c -h/(1-h)*(1/sigma)*c(-1);
y   = a + lab;
pic = beta_C/(1+beta_C*chi_p)*pic(+1) + chi_p/(1+beta_C*chi_p)*pic(-1) + (1-theta_p)*(1-theta_p*beta_C)/theta_p/(1+beta_C*chi_p)*mc;
mc = rw - a;
rnom= phi_pic*pic + phi_y*y + z;
y   = c;

// Shock processes
a   = rho_a*a(-1) + e_a;
g   = rho_g*g(-1) + e_g;
z   = rho_z*z(-1) + e_z;

// Observation equations
rnom_obs=infl_ss+growth_ss-400*log(beta_C)+400*rnom;
pic_obs=infl_ss+400*pic;
y_obs=growth_ss+400*(y-y(-1));
end;

shocks;
var e_a; stderr 0.01;
var e_g; stderr 0.01;
var e_z; stderr 0.01;
end; 

steady;
check;

estimated_params;
beta_C,0.995,,,GAMMA_PDF,0.995,0.001;
sigma,1,,,GAMMA_PDF,1,0.5;
sigma_L,1,,,GAMMA_PDF,1,0.5;
theta_p,0.75,,,BETA_PDF,0.75,0.05;
phi_pic,1.5,,,GAMMA_PDF,1.5,.25;
phi_y,.125,,,GAMMA_PDF,.125,.05;
h,0.3,,,BETA_PDF,0.5,0.2;
chi_p,0.3,,,BETA_PDF,0.5,0.2;
growth_ss,2,,,NORMAL_PDF,3,1;
infl_ss,2,,,NORMAL_PDF,3,1;

rho_a,0.9,,,BETA_PDF,0.8,0.1;
rho_g,0.8,,,BETA_PDF,0.8,0.1;
rho_z,0.7,,,BETA_PDF,0.8,0.1;
stderr e_a,0.01,,,GAMMA_PDF,0.01,0.005;
stderr e_g,0.01,,,GAMMA_PDF,0.01,0.005;
stderr e_z,0.01,,,GAMMA_PDF,0.01,0.005;
end;

varobs rnom_obs pic_obs y_obs;
estimation(datafile='data_cons.csv',
mh_replic=5000,  
mh_nblocks=1,
mh_jscale=0.3,
mh_drop=0.2,
%mode_file=nk_closedv1_est_trans_mode,
prior_trunc=1e-32, 
nodiagnostic, 
graph_format = none);


% shock_decomposition rnom_obs pic_obs y_obs;