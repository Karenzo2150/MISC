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
%% This file generates the simulation for the Blanchard-Gali (2007) model, oil price shocks
%% ... Alternative calibrations for Taylor rule
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Contact
%% Pau Rabanal: PRabanal@IMF.org
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% close all
% clear all
% 
dynare blanchard_gali_phi11
dynare blanchard_gali_phi2

close all
clear all

load blanchard_gali_phi11_results.mat
BG_IRF=oo_.irfs;
 
load blanchard_gali_phi2_results.mat
BG_PHI2_IRF=oo_.irfs;

time=[1:1:size(BG_IRF.q_e_a,2)];

% Response to an oil shock
figure(1);
subplot(3,2,1);plot(time,BG_IRF.q_e_rm','r.-',time,BG_PHI2_IRF.q_e_rm','b--',time,BG_IRF.q_e_rm'*0,'k-','LineWidth',2);title('Output');
subplot(3,2,2);plot(time,BG_IRF.c_e_rm','r.-',time,BG_PHI2_IRF.c_e_rm','b--',time,BG_IRF.c_e_rm'*0,'k-','LineWidth',2);title('Consumption');
subplot(3,2,3);plot(time,BG_IRF.piq_e_rm','r.-',time,BG_PHI2_IRF.piq_e_rm','b--',time,BG_IRF.piq_e_rm'*0,'k-','LineWidth',2);title('Domestic Inflation');
subplot(3,2,4);plot(time,BG_IRF.pic_e_rm','r.-',time,BG_PHI2_IRF.pic_e_rm','b--',time,BG_IRF.pic_e_rm'*0,'k-','LineWidth',2);title('CPI Inflation');
subplot(3,2,5);plot(time,BG_IRF.rnom_e_rm','r.-',time,BG_PHI2_IRF.rnom_e_rm','b--',time,BG_IRF.rnom_e_rm'*0,'k-','LineWidth',2);title('Interest Rate');
subplot(3,2,6);plot(time,BG_IRF.rw_e_rm','r.-',time,BG_PHI2_IRF.rw_e_rm','b--',time,BG_IRF.rw_e_rm'*0,'k-','LineWidth',2);title('Real Wage');
legend('phi=1.1','phi=2');