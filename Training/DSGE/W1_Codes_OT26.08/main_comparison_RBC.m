%%% RBC Model

%%% December 4, 2017

%%% This file performs sensitivity analysis in the RBC model 

clear all;
close all;
clc
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STEP 1. CALIBRATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global theta_vec delta rho_vec sigmae_vec gamma_vec beta  alpha_vec eta;

%%%% EXPLICIT PARAMETERS
% capital share in production function
theta_vec = [0.40 0.35];
% depreciation rate
delta     = 0.012 ;
% labor augmenting technical progress
gamma_vec = [(1.0156^0.25) - 1 (1.0156^0.25)-1];
% populaton growth
eta       = (1.012^0.25) - 1;
% discount factor
beta      = 0.987;
% leisure preference in utility function
alpha_vec = [0.64 0.64];
% persistence of technology shock
rho_vec   = [0.95 0.95];
% size of technology shock
sigmae_vec   =  [0.007 0.007];

save rbc_params.mat theta_vec delta rho_vec sigmae_vec gamma_vec beta alpha_vec eta;

kk=1;
while kk<=2

    if kk==1
       
       theta     = theta_vec(kk);
       rho       = rho_vec(kk);
       gamma     = gamma_vec(kk);
       alpha     = alpha_vec(kk);
       sigmae    = sigmae_vec(kk);
       
       save rbc_params1.mat theta delta rho sigmae gamma beta alpha eta;
       
       dynare  rbc_scenarios.mod noclearall
     
       y1  = y_e; 
       c1  = c_e; 
       k1  = k_e; 
       i1  = i_e; 
       n1  = n_e; 
       z1   = z_e;

       save baseline.mat y1 c1 k1 i1 n1 z1;
       
    end;

    if kk==2
       
       theta     = theta_vec(kk);
       rho       = rho_vec(kk);
       gamma     = gamma_vec(kk);
       alpha     = alpha_vec(kk);
       sigmae     = sigmae_vec(kk);
       
       save rbc_params.mat theta delta rho sigmae gamma beta alpha eta;
       
       dynare  rbc_scenarios.mod noclearall
       
       y2  = y_e;
       c2  = c_e; 
       k2  = k_e; 
       i2  = i_e; 
       n2  = n_e; 
       z2   = z_e;

       save alternative.mat y2 c2 k2 i2 n2 z2;
       
    end;
    
    kk=kk + 1;
end;


close all;

load baseline.mat
load alternative.mat

t=1:1:100;

NN = 40;

figure(1);
plot(t(1:NN),z1(1:NN),'b','LineWidth',2); hold on;
%hold on; 
plot(t(1:NN),z2(1:NN),'r:','LineWidth',2);    
grid on;
H=gca;
set(H,'fontsize',10);
set(H,'LineWidth',1.5);
set(H,'GridLineStyle',':');
title('Exchange rate (z)','FontSize',10);


figure(2);
subplot(2,3,5); 
plot(t(1:NN),y1(1:NN),'b','LineWidth',2); hold on; 
plot(t(1:NN),y2(1:NN),'r:','LineWidth',2);    
grid on;
H=gca;
set(H,'fontsize',10);
set(H,'LineWidth',1.5);
set(H,'GridLineStyle',':');
title('Tot output (y)','FontSize',10);


subplot(2,3,1); 
plot(t(1:NN),c1(1:NN),'b','LineWidth',2); hold on; 
plot(t(1:NN),c2(1:NN),'r:','LineWidth',2);    
grid on;
H=gca;
set(H,'fontsize',10);
set(H,'LineWidth',1.5);
set(H,'GridLineStyle',':');
title('Consumption (c)','FontSize',10);

legend ({'Baseline', 'Alternative'},'FontSize',6);
legend('boxoff')


subplot(2,3,2); 
plot(t(1:NN),k1(1:NN),'b','LineWidth',2); hold on; 
plot(t(1:NN),k2(1:NN),'r:','LineWidth',2);    
grid on;
H=gca;
set(H,'fontsize',10);
set(H,'LineWidth',1.5);
set(H,'GridLineStyle',':');
title('Capital(k)','FontSize',10);

subplot(2,3,6); 
plot(t(1:NN),i1(1:NN),'b','LineWidth',2); hold on; 
plot(t(1:NN),i2(1:NN),'r:','LineWidth',2);    
grid on;
H=gca;
set(H,'fontsize',10);
set(H,'LineWidth',1.5);
set(H,'GridLineStyle',':');
title('Interest rate(i)','FontSize',10);

subplot(2,3,3); 
plot(t(1:NN),n1(1:NN),'b','LineWidth',2); hold on; 
plot(t(1:NN),n2(1:NN),'r:','LineWidth',2);    
grid on;
H=gca;
set(H,'fontsize',10);
set(H,'LineWidth',1.5);
set(H,'GridLineStyle',':');
title('Labor size (n)','FontSize',10);

y_n1=y1/n1 ;
y_n2=y2/n2 ;

subplot(2,3,4); 
plot(t(1:NN),y_n1(1:NN),'b','LineWidth',2); hold on; 
plot(t(1:NN),y_n2(1:NN),'r:','LineWidth',2);    
grid on;
H=gca;
set(H,'fontsize',10);
set(H,'LineWidth',1.5);
set(H,'GridLineStyle',':');
title('Output per labor (y/n)','FontSize',10);
