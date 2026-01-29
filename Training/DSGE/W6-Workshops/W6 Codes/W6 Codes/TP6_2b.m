%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. Model with the financial accelerator and base monetary regime
dynare bgg4_model1.mod 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varble = {'rnom','y','pic','inv','qr','n','m','rer'};
names  ={'Nominal interest rate','GDP', 'Inflation rate','Investment','Asset prices','Net worth','Imports','Real exchange rate'};
[nper,junk1] = size(rnom_e_z);
nvar = length(varble);
dates = (0:1:nper)';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose betwen different shocks: monetary (e_z), goverment (e_g), supply
% (e_a), risk (e_s_omega), foreign demand (e_yf)
shock  = 'e_rnomstar';
size_shock = 1;
resp_mat0 = [];
for ii=1:nvar
    eval(['y0=',char(varble(ii)),'_',char(shock),';']);
    y0= y0*size_shock;
    y0=[0;y0];
    resp_mat0 = [resp_mat0 y0];
end
save('bgg4_soe_model0','resp_mat0');

clear all
clear classes

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. Model with the financial accelerator and the manage float regime
dynare bgg4_model1a.mod 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
varble = {'rnom','y','pic','inv','qr','n','m','rer'};
names  ={'Nominal interest rate','GDP', 'Inflation rate','Investment','Asset prices','Net worth','Imports','Real exchange rate'};
[nper,junk1] = size(rnom_e_z);
nvar = length(varble);
dates = (0:1:nper)';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Choose betwen different shocks: monetary (e_z), goverment (e_g), supply
% (e_a), risk (e_s_omega), foreign demand (e_yf)
shock  = 'e_rnomstar';
size_shock = 1;
resp_mat1 = [];
for ii=1:nvar
    eval(['y1=',char(varble(ii)),'_',char(shock),';']);
    y1= y1*size_shock;
    y1=[0;y1];
    resp_mat1 = [resp_mat1 y1];
end
save('bgg4_soe_model1','resp_mat1');

load bgg4_soe_model0
figure(1)
for ii=1:nvar
    subplot(4,2,ii);
    plot(dates,resp_mat0(:,ii),'-*b',dates,resp_mat1(:,ii),'-ob');
    if ii>6
        xlabel('Quarters','Fontsize',14)
    end
    ylabel('Deviation from SS','Fontsize',14)
    title(names(ii),'Interpreter','none','Fontsize',14);
    if ii==1
        legend('BGG','BGG+Managed Float');
    end
end
