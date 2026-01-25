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
%% This file generates the simulation for the Blanchard-Gali (2007) model, technology shocks
%% ... Alternative calibrations for real wage rigidity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Contact
%% Pau Rabanal: PRabanal@IMF.org
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% close all
% clear all
% 

dynare blanchard_gali
dynare blanchard_gali_gamma

close all
clear all

load blanchard_gali_results.mat
BG_IRF=oo_.irfs;
 
load blanchard_gali_gamma_results.mat
BG_GAMMA_IRF=oo_.irfs;

time=[1:1:size(BG_IRF.q_e_a,2)];

% Response to technology shock
figure(1);
subplot(3,2,1);plot(time,BG_IRF.q_e_a','r.-',time,BG_GAMMA_IRF.q_e_a','b--',time,BG_IRF.q_e_a'*0,'k-','LineWidth',2);title('Output');
subplot(3,2,2);plot(time,BG_IRF.c_e_a','r.-',time,BG_GAMMA_IRF.c_e_a','b--',time,BG_IRF.c_e_a'*0,'k-','LineWidth',2);title('Consumption');
subplot(3,2,3);plot(time,BG_IRF.piq_e_a','r.-',time,BG_GAMMA_IRF.piq_e_a','b--',time,BG_IRF.piq_e_a'*0,'k-','LineWidth',2);title('Domestic Inflation');
subplot(3,2,4);plot(time,BG_IRF.pic_e_a','r.-',time,BG_GAMMA_IRF.pic_e_a','b--',time,BG_IRF.pic_e_a'*0,'k-','LineWidth',2);title('CPI Inflation');
subplot(3,2,5);plot(time,BG_IRF.rnom_e_a','r.-',time,BG_GAMMA_IRF.rnom_e_a','b--',time,BG_IRF.rnom_e_a'*0,'k-','LineWidth',2);title('Interest Rate');
subplot(3,2,6);plot(time,BG_IRF.rw_e_a','r.-',time,BG_GAMMA_IRF.rw_e_a','b--',time,BG_IRF.rw_e_a'*0,'k-','LineWidth',2);title('Real Wage');
legend('Flexible Wages','Sticky Wages');