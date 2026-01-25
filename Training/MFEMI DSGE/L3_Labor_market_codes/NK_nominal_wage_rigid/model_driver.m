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
%% ... with and without real/nominal wage rigidity
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
var_list = {'X','Y','YN','PI','INT','RN','MC'};
for i = 1:length(shk_list);
for j = 1:length(var_list);    
    eval(sprintf(['sim_nk.%s_%s=%s_%s;'],var_list{j},shk_list{i},var_list{j},shk_list{i}));
end
end

cd ../NK_real_wage_rigid/
dynare nk_real_wage_rigid.mod
shk_list = {'EPS_A','EPS_C','EPS_PI','EPS_INT'};
var_list = {'X','Y','YN','PI','INT','RN','MC'};
for i = 1:length(shk_list);
for j = 1:length(var_list);    
    eval(sprintf(['sim_rwage.%s_%s=%s_%s;'],var_list{j},shk_list{i},var_list{j},shk_list{i}));
end
end

cd ../NK_nominal_wage_rigid/
dynare nk_nominal_wage_rigid.mod
shk_list = {'EPS_A','EPS_C','EPS_PI','EPS_INT'};
var_list = {'X','Y','YN','PI','INT','RN','MC'};
for i = 1:length(shk_list);
for j = 1:length(var_list);    
    eval(sprintf(['sim_nwage.%s_%s=%s_%s;'],var_list{j},shk_list{i},var_list{j},shk_list{i}));
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Technology shock
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure('name','Technology shock');
subplot(2,2,1);
p=plot(1:20,[sim_nk.X_EPS_A sim_rwage.X_EPS_A sim_nwage.X_EPS_A],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Output gap','Fontsize',12);
l=legend('NK basic','Real wage rigidity','Nominal wage rigidity');
set(l,'Fontsize',12);
set(l,'Location','Best');

subplot(2,2,2);
p=plot(1:20,[sim_nk.YN_EPS_A sim_rwage.YN_EPS_A sim_nwage.YN_EPS_A],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Potential GDP','Fontsize',12);

subplot(2,2,3);
p=plot(1:20,[sim_nk.PI_EPS_A sim_rwage.PI_EPS_A sim_nwage.PI_EPS_A],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Inflation','Fontsize',12);

subplot(2,2,4);
p=plot(1:20,[sim_nk.INT_EPS_A sim_rwage.INT_EPS_A sim_nwage.INT_EPS_A],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Interest rate','Fontsize',12);

name='nwage_tech_shk';
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
p=plot(1:20,[sim_nk.X_EPS_C sim_rwage.X_EPS_C sim_nwage.X_EPS_C],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Output gap','Fontsize',12);
l=legend('NK basic','Real wage rigidity','Nominal wage rigidity');
set(l,'Fontsize',12);
set(l,'Location','Best');

subplot(2,2,2);
p=plot(1:20,[sim_nk.MC_EPS_C sim_rwage.MC_EPS_C sim_nwage.MC_EPS_C],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Marginal Cost','Fontsize',12);

subplot(2,2,3);
p=plot(1:20,[sim_nk.PI_EPS_C sim_rwage.PI_EPS_C sim_nwage.PI_EPS_C],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Inflation','Fontsize',12);

subplot(2,2,4);
p=plot(1:20,[sim_nk.INT_EPS_C sim_rwage.INT_EPS_C sim_nwage.INT_EPS_C],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Interest rate','Fontsize',12);

name='nwage_demand_shk';
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
p=plot(1:20,[sim_nk.X_EPS_PI sim_rwage.X_EPS_PI sim_nwage.X_EPS_PI],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Output gap','Fontsize',12);
l=legend('NK basic','Real wage rigidity','Nominal wage rigidity');
set(l,'Fontsize',12);
set(l,'Location','Best');

subplot(2,2,2);
p=plot(1:20,[sim_nk.MC_EPS_PI sim_rwage.MC_EPS_PI sim_nwage.MC_EPS_PI],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Marginal Cost','Fontsize',12);

subplot(2,2,3);
p=plot(1:20,[sim_nk.PI_EPS_PI sim_rwage.PI_EPS_PI sim_nwage.PI_EPS_PI],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Inflation','Fontsize',12);

subplot(2,2,4);
p=plot(1:20,[sim_nk.INT_EPS_PI sim_rwage.INT_EPS_PI sim_nwage.INT_EPS_PI],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Interest rate','Fontsize',12);

name='nwage_supply_shk';
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
p=plot(1:20,[sim_nk.X_EPS_INT sim_rwage.X_EPS_INT sim_nwage.X_EPS_INT],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Output gap','Fontsize',12);
l=legend('NK basic','Real wage rigidity','Nominal wage rigidity');
set(l,'Fontsize',12);
set(l,'Location','Best');

subplot(2,2,2);
p=plot(1:20,[sim_nk.MC_EPS_INT sim_rwage.MC_EPS_INT sim_nwage.MC_EPS_INT],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Marginal Cost','Fontsize',12);

subplot(2,2,3);
p=plot(1:20,[sim_nk.PI_EPS_INT sim_rwage.PI_EPS_INT sim_nwage.PI_EPS_INT],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Inflation','Fontsize',12);

subplot(2,2,4);
p=plot(1:20,[sim_nk.INT_EPS_INT sim_rwage.INT_EPS_INT sim_nwage.INT_EPS_INT],'linewidth',2);
set(p(1),'linestyle','-');set(p(2),'linestyle','-.');set(p(3),'linestyle',':');
set(p(1),'linewidth',3);set(p(2),'linewidth',3);set(p(3),'linewidth',3);
set(p(1),'color','black');set(p(2),'color','red');set(p(3),'color',[34 148 61]/255);
hold on;
grid on;
title('Interest rate','Fontsize',12);

name='nwage_monpol_shk';
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
