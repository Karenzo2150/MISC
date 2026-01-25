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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Contacts
%% Felipe Zanna: FZanna@IMF.org
%% Daniel Baksa: DBaksa2@IMF.org
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
close all;
clear all;

%% First we have to run the Dynare and calculate the IRFs
dynare basic_nk

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Technology shock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','Technology shock');
subplot(2,2,1);
p=plot(1:20,[X_EPS_A YN_EPS_A],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('GDP','Fontsize',12);
l=legend('Output gap','Trend');
set(l,'Fontsize',12);
set(l,'Location','Best');

subplot(2,2,2);
p=plot(1:20,PI_EPS_A,'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('Inflation','Fontsize',12);
ylim([-0.5 1]);

subplot(2,2,3);
p=plot(1:20,[INT_EPS_A RN_EPS_A],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('Interest rate','Fontsize',12);
l=legend('Total','Natural rate');
set(l,'Fontsize',12);
set(l,'Location','Best');

% Saving into pdf, under the following name
name='basic_tech_shk';
Y = 21.0;                  % A4 paper size
X = 29.7;                  % A4 paper size

xMargin = 1;               % left/right margins from page borders
yMargin = 1;               % bottom/top margins from page borders
xSize = X - 2*xMargin;     % figure size on paper (widht & hieght)
ySize = Y - 2*yMargin;     % figure size on paper (widht & hieght)

set(gcf, 'Units','centimeters', 'Position',[0 0 xSize ySize]/2)
set(gcf, 'PaperUnits','centimeters')
set(gcf, 'PaperSize',[X Y])
set(gcf, 'PaperPosition',[xMargin yMargin xSize ySize])
set(gcf, 'PaperOrientation','portrait') 
eval(sprintf('print -dpdf -r0 %s.pdf',name));
% Saving into png we have to use -dpng instead of -dpdf

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Aggregate Demand shock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','Aggregate Demand shock');
subplot(2,2,1);
p=plot(1:20,X_EPS_C,'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('GDP','Fontsize',12);

subplot(2,2,2);
p=plot(1:20,PI_EPS_C,'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('Inflation','Fontsize',12);

subplot(2,2,3);
p=plot(1:20,INT_EPS_C,'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('Interest rate','Fontsize',12);

% Saving into pdf, under the following name
name='basic_demand_shk';
Y = 21.0;                  % A4 paper size
X = 29.7;                  % A4 paper size

xMargin = 1;               % left/right margins from page borders
yMargin = 1;               % bottom/top margins from page borders
xSize = X - 2*xMargin;     % figure size on paper (widht & hieght)
ySize = Y - 2*yMargin;     % figure size on paper (widht & hieght)

set(gcf, 'Units','centimeters', 'Position',[0 0 xSize ySize]/2)
set(gcf, 'PaperUnits','centimeters')
set(gcf, 'PaperSize',[X Y])
set(gcf, 'PaperPosition',[xMargin yMargin xSize ySize])
set(gcf, 'PaperOrientation','portrait') 
eval(sprintf('print -dpdf -r0 %s.pdf',name));
% Saving into png we have to use -dpng instead of -dpdf


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Aggregate Supply shock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','Aggregate Supply shock');
subplot(2,2,1);
p=plot(1:20,X_EPS_PI,'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('GDP','Fontsize',12);

subplot(2,2,2);
p=plot(1:20,PI_EPS_PI,'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('Inflation','Fontsize',12);

subplot(2,2,3);
p=plot(1:20,INT_EPS_PI,'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('Interest rate','Fontsize',12);

name='basic_supply_shk';
Y = 21.0;                  % A4 paper size
X = 29.7;                  % A4 paper size

xMargin = 1;               % left/right margins from page borders
yMargin = 1;               % bottom/top margins from page borders
xSize = X - 2*xMargin;     % figure size on paper (widht & hieght)
ySize = Y - 2*yMargin;     % figure size on paper (widht & hieght)

set(gcf, 'Units','centimeters', 'Position',[0 0 xSize ySize]/2)
set(gcf, 'PaperUnits','centimeters')
set(gcf, 'PaperSize',[X Y])
set(gcf, 'PaperPosition',[xMargin yMargin xSize ySize])
set(gcf, 'PaperOrientation','portrait') 
eval(sprintf('print -dpdf -r0 %s.pdf',name));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Monetary policy shock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','Monetary policy shock');
subplot(2,2,1);
p=plot(1:20,X_EPS_INT,'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('GDP','Fontsize',12);

subplot(2,2,2);
p=plot(1:20,PI_EPS_INT,'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('Inflation','Fontsize',12);

subplot(2,2,3);
p=plot(1:20,INT_EPS_INT,'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('Interest rate','Fontsize',12);

% Saving into pdf, under the following name
name='basic_monpol_shk';
Y = 21.0;                  % A4 paper size
X = 29.7;                  % A4 paper size

xMargin = 1;               % left/right margins from page borders
yMargin = 1;               % bottom/top margins from page borders
xSize = X - 2*xMargin;     % figure size on paper (widht & hieght)
ySize = Y - 2*yMargin;     % figure size on paper (widht & hieght)

set(gcf, 'Units','centimeters', 'Position',[0 0 xSize ySize]/2)
set(gcf, 'PaperUnits','centimeters')
set(gcf, 'PaperSize',[X Y])
set(gcf, 'PaperPosition',[xMargin yMargin xSize ySize])
set(gcf, 'PaperOrientation','portrait') 
eval(sprintf('print -dpdf -r0 %s.pdf',name));
% Saving into png we have to use -dpng instead of -dpdf

