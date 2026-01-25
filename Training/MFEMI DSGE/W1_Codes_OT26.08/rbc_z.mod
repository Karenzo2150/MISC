% Basic RBC Model as described in Chapter 1 of Cooley, 
% Frontiers of Business Cycle Research
% 
% Details:
%   1) Computation in levels, 1st order approximation.
%   2) Calculates also by perturbation investment (i) and labor 
%   productivity (y_l).
%   3) Calibration from Cooley and Prescott.
%
% Jesus Fernandez-Villaverde
% Philadelphia, March 3, 2005
% Modified by Felipe Zanna (ICD@IMF) on May 19, 2021 to make it consistent with lecture


%----------------------------------------------------------------
% 0. Housekeeping
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var z k c n i y w r yn;  // endogenous variables


varexo e;            // exogenous shock

parameters theta delta rho sigmae gamma beta alpha eta;

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

% Technology
theta  = 0.4;
delta  = 0.012;
rho    = 0.95;
sigmae  = 0.007; 
gamma  = (1.0156^0.25)-1;


% Preferences
beta   = 0.987;
alpha  = 0.64;
eta    = (1.012^0.25)-1;

%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;
  (1+gamma)/c = beta*(1/c(+1))*(r(+1)+1-delta);
  alpha*c/((1-alpha)*(1-n)) = w;      
  y = c + i;
  y = exp(z)*(k(-1)^theta)*(n^(1-theta));
  (1+gamma)*(1+eta)*k = i + (1-delta)*k(-1);
  w   = (1-theta)*y/n; 
  r   =  theta*y/k(-1);
  
  z-z(-1) = rho*(z(-1)-z(-2))+e;
  //z     = rho*z(-1)+e;
  yn = y/n;
 end;

%----------------------------------------------------------------
% 4. Computation
%----------------------------------------------------------------

initval;
  k = 24;
  c = 1.33;
  n = 0.31;
  y = (k^theta)*(n^(1-theta));
  w = (1-theta)*y/n; 
  r =  theta*y/k;
  i = (1+gamma)*(1+eta)*k-(1-delta)*k;
  z = 0; 
  e = 0;
end;

shocks;
var e = sigmae^2;
end;

check;
steady;

stoch_simul(hp_filter = 1600, order = 1, irf=40) y c i k n w r z yn;

%----------------------------------------------------------------
% 5. Some Results
%----------------------------------------------------------------

statistic1 = 100*sqrt(diag(oo_.var(1:7,1:7)))./oo_.mean(1:7);
names = ['y '; 'c '; 'i '; 'k '; 'n '; 'w '; 'r '];
dyntable(options_,'Relative standard deviations in %',strvcat('VARIABLE','REL. S.D.'),names,statistic1(1:7),10,7,4);
