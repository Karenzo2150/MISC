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
%% This file generates the simulations and comparison of the New-Keynesian models:
%% ... closed economy
%% ... with and without unemployment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Contacts
%% Felipe Zanna: FZanna@IMF.org
%% Daniel Baksa: DBaksa2@IMF.org
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
close all;
clear all;

cd ../Basic_NK/
dynare basic_nk.mod
shk_list = {'EPS_A','EPS_C','EPS_PI','EPS_INT'};
var_list = {'Y','PI','INT','XI_C','MC','A','W','L'};
for i = 1:length(shk_list);
for j = 1:length(var_list);    
    eval(sprintf(['sim_nk.%s_%s=%s_%s;'],var_list{j},shk_list{i},var_list{j},shk_list{i}));
end
end

%% The model with unemployment is a non-linear model, and the Dynare applies linear approximation
%% But the basic NK is log-linearized. In order to express the variables in the same unit,  
%% the levels from model with unemployment should be divided by their steady-state value 
%% and multiplied by 100. 

cd ../Unemployment_MPT/
dynare nk_unemployment
shk_list = {'EPS_A','EPS_C','EPS_PI','EPS_INT','EPS_G'};
var_list = {'Y','C','PI','INT','U','W','XI_C','L'};
for i = 1:length(shk_list);
for j = 1:length(var_list);    
    eval(sprintf(['sim_un.%s_%s=%s_%s;'],var_list{j},shk_list{i},var_list{j},shk_list{i}));
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Technology shock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','Technology shock');
subplot(2,2,1);
p=plot(1:20,[sim_nk.Y_EPS_A sim_un.Y_EPS_A/Y_STEADY*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('GDP','Fontsize',12);
l=legend('NK basic','NK with Unemployment');
set(l,'Fontsize',12);
set(l,'Location','Best');

subplot(2,2,2);
p=plot(1:20,[sim_nk.PI_EPS_A sim_un.PI_EPS_A*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('Inflation','Fontsize',12);

subplot(2,2,3);
p=plot(1:20,[sim_nk.INT_EPS_A sim_un.INT_EPS_A*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('Interest rate','Fontsize',12);

subplot(2,2,4);
p=plot(1:20,[sim_nk.L_EPS_A sim_un.L_EPS_A/L_STEADY*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('Employment','Fontsize',12);

name='nk_unemp_tech_shk';
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
%% Aggregate Demand shock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','Aggregate Demand shock');
subplot(2,2,1);
p=plot(1:20,[sim_nk.Y_EPS_C sim_un.Y_EPS_C/Y_STEADY*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('GDP','Fontsize',12);
l=legend('NK basic','NK with Unemployment');
set(l,'Fontsize',12);
set(l,'Location','Best');

subplot(2,2,2);
p=plot(1:20,[sim_nk.PI_EPS_C sim_un.PI_EPS_C*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('Inflation','Fontsize',12);

subplot(2,2,3);
p=plot(1:20,[sim_nk.INT_EPS_C sim_un.INT_EPS_C*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('Interest rate','Fontsize',12);

subplot(2,2,4);
p=plot(1:20,[sim_nk.W_EPS_C sim_un.W_EPS_C/W_STEADY*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('Real Wage','Fontsize',12);


name='nk_unemp_demand_shk';
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
%% Aggregate Supply shock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','Aggregate Supply shock');
subplot(2,2,1);
p=plot(1:20,[sim_nk.Y_EPS_PI sim_un.Y_EPS_PI/Y_STEADY*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('GDP','Fontsize',12);
l=legend('NK basic','NK with Unemployment');
set(l,'Fontsize',12);
set(l,'Location','Best');

subplot(2,2,2);
p=plot(1:20,[sim_nk.PI_EPS_PI sim_un.PI_EPS_PI*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('Inflation','Fontsize',12);

subplot(2,2,3);
p=plot(1:20,[sim_nk.INT_EPS_PI sim_un.INT_EPS_PI*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('Interest rate','Fontsize',12);

subplot(2,2,4);
p=plot(1:20,[sim_nk.L_EPS_PI sim_un.L_EPS_PI/L_STEADY*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('Employment','Fontsize',12);

name='nk_unemp_supply_shk';
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
p=plot(1:20,[sim_nk.Y_EPS_INT sim_un.Y_EPS_INT/Y_STEADY*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('GDP','Fontsize',12);
l=legend('NK basic','NK with Unemployment');
set(l,'Fontsize',12);
set(l,'Location','Best');

subplot(2,2,2);
p=plot(1:20,[sim_nk.PI_EPS_INT sim_un.PI_EPS_INT*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('Inflation','Fontsize',12);

subplot(2,2,3);
p=plot(1:20,[sim_nk.INT_EPS_INT sim_un.INT_EPS_INT*100],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');
hold on;
grid on;
title('Interest rate','Fontsize',12);

subplot(2,2,4);
p=plot(1:20,[sim_un.U_EPS_INT*100],'linewidth',2);
set(p(1),'linestyle','-.');
set(p(1),'linewidth',3);
set(p(1),'color','red');
hold on;
grid on;
title('Unemployment','Fontsize',12);


name='nk_unemp_monpol_shk';
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

return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Government  shock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','Gov. demand shock');
subplot(2,2,1);
p=plot(1:20,[sim_un.Y_EPS_G/Y_STEADY*100],'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('GDP','Fontsize',12);

subplot(2,2,2);
p=plot(1:20,[sim_un.PI_EPS_G*100],'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('Inflation','Fontsize',12);

subplot(2,2,3);
p=plot(1:20,[sim_un.INT_EPS_G*100],'linewidth',2);
set(p(1),'linestyle','-');
set(p(1),'linewidth',3);
set(p(1),'color','black');
hold on;
grid on;
title('Interest rate','Fontsize',12);

name='nk_unemp_unempr_shk';
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


