%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
dynare nk_3soe1a.mod % CITR with no effective FXI
dynare nk_3soe1b.mod % CITR with effective FXI

clear all;
load('results3a_CITR.mat');
CITR_deep_oo_ = CITR_oo_;

load('results3b_CITR.mat');
CITR_shallow_oo_ = CITR_oo_;

varble = {'rnom','y','pic','rer','dep','pih','chstar','cf'};
names  ={'Nominal interest rate','GDP', 'CPI inflation','Real exchange rate','Exchange rate','Domestic inflation','Exports','Imports'};
[nper,junk1] = size(CITR_shallow_oo_.irfs.rnom_e_z');
nvar = length(varble);
dates = (0:1:nper)';

cumm_matrix = eye(nper+1);
for icol=1:nper
    cumm_matrix(icol+1:nper+1,icol) = ones(nper+1-icol,1);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analyzing the effect a FXI under deep and shallow FX markets
shock  = 'e_fx';
size_shock = -1;
resp_mat2 = [];
figure('name',' Impulse responses to a sales of FX reserves')
for ii=1:nvar
    eval(['y2=CITR_shallow_oo_.irfs.',char(varble(ii)),'_',char(shock),';']);
    y2= y2'*size_shock;
    y2=[0;y2];
    eval(['y0=CITR_deep_oo_.irfs.',char(varble(ii)),'_',char(shock),';']);
    y0= y0'*size_shock;
    y0=[0;y0];
    subplot(4,2,ii);
    if ii==5
        plot(dates,cumm_matrix*y0,'-+k',dates,cumm_matrix*y2,'-b','LineWidth',2);
    else
        plot(dates,y0,'-+k',dates,y2,'-b','LineWidth',2);
    end
    if ii>nvar-2
        xlabel('Quarters','Fontsize',8)
    end
    ylabel('Dev. from SS','Fontsize',8)
    title(names(ii),'Interpreter','none','Fontsize',10);
    resp_mat2 = [resp_mat2 y2];
    if ii==1
        legend('Deep FX market','Shallow FX market')
    end
end

