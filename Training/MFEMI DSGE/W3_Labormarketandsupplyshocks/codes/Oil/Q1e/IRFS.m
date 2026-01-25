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
%% ... Comparing calibration for the 1970s and the 2000s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Contact
%% Pau Rabanal: PRabanal@IMF.org
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% close all
% clear all
% 
dynare blanchard_gali70
dynare blanchard_gali2000

close all
clear all

load blanchard_gali70_results.mat
BG_1970_IRF=oo_.irfs;
 
load blanchard_gali2000_results.mat
BG_2000_IRF=oo_.irfs;

time=[1:1:size(BG_1970_IRF.q_e_a,2)];

% Response to an oil shock
figure(1);
subplot(3,2,1);plot(time,BG_1970_IRF.q_e_rm','r.-',time,BG_2000_IRF.q_e_rm','b--',time,BG_1970_IRF.q_e_rm'*0,'k-','LineWidth',2);title('Output');
subplot(3,2,2);plot(time,BG_1970_IRF.c_e_rm','r.-',time,BG_2000_IRF.c_e_rm','b--',time,BG_1970_IRF.c_e_rm'*0,'k-','LineWidth',2);title('Consumption');
subplot(3,2,3);plot(time,BG_1970_IRF.piq_e_rm','r.-',time,BG_2000_IRF.piq_e_rm','b--',time,BG_1970_IRF.piq_e_rm'*0,'k-','LineWidth',2);title('Domestic Inflation');
subplot(3,2,4);plot(time,BG_1970_IRF.pic_e_rm','r.-',time,BG_2000_IRF.pic_e_rm','b--',time,BG_1970_IRF.pic_e_rm'*0,'k-','LineWidth',2);title('CPI Inflation');
subplot(3,2,5);plot(time,BG_1970_IRF.rnom_e_rm','r.-',time,BG_2000_IRF.rnom_e_rm','b--',time,BG_1970_IRF.rnom_e_rm'*0,'k-','LineWidth',2);title('Interest Rate');
subplot(3,2,6);plot(time,BG_1970_IRF.rw_e_rm','r.-',time,BG_2000_IRF.rw_e_rm','b--',time,BG_1970_IRF.rw_e_rm'*0,'k-','LineWidth',2);title('Real Wage');
legend('1970','2000');