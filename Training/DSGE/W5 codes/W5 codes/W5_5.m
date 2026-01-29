%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;

dynare nk_3soe1b.mod % CITR with effective FXI

clear all;

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
% A. Risk premium shock
shock  = 'e_varphi';
size_shock = 1;
resp_mat1 = [];
for ii=1:nvar
    eval(['y1=CITR_shallow_oo_.irfs.',char(varble(ii)),'_',char(shock),';']);
    y1= y1'*size_shock;
    y1=[0;y1];
    resp_mat1 = [resp_mat1 y1];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% B. FXI
shock  = 'e_fx';
size_shock = -1;
resp_mat2 = [];
for ii=1:nvar
    eval(['y2=CITR_shallow_oo_.irfs.',char(varble(ii)),'_',char(shock),';']);
    y2= y2'*size_shock;
    y2=[0;y2];
    resp_mat2 = [resp_mat2 y2];
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% C. Combining the risk premium shoch with a FXI
figure('name',' Impulse responses to a risk premium shock using FXI')
for ii=1:nvar
    subplot(4,2,ii);
    if ii==5
        plot(dates,cumm_matrix*resp_mat1(:,ii),'-b',dates,cumm_matrix*(resp_mat1(:,ii)+resp_mat2(:,ii)),'LineWidth',2);
    else
        plot(dates,resp_mat1(:,ii),'-b',dates,resp_mat1(:,ii)+resp_mat2(:,ii),'LineWidth',2);
    end
    if ii>nvar-2
        xlabel('Quarters','Fontsize',8)
    end
    ylabel('Dev. from SS','Fontsize',8)
    title(names(ii),'Interpreter','none','Fontsize',10);
    if ii==1
        legend('No FXI','FXI')
    end
end