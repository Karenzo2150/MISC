%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;

dynare nk_4soe1a.mod; % PCP (baseline)
dynare nk_4soe1b.mod; % LCP for imported goods
dynare nk_4soe1c.mod; % LCP for imported and exported goods

clear all;
load('results4a_CITR.mat');
CITR1a_oo_=CITR_oo_;
load('results4b_CITR.mat');
CITR1b_oo_= CITR_oo_;
load('results4c_CITR.mat');
CITR1c_oo_= CITR_oo_;

varble = {'rnom','y','pic','rer','dep','pih','chstar','cf'};
names  ={'Nominal interest rate','GDP', 'CPI inflation','Real exchange rate','Exchange rate','Domestic inflation','Exports','Imports'};
[nper,junk1] = size(CITR1a_oo_.irfs.rnom_e_z');
nvar = length(varble);
dates = (0:1:nper)';

cumm_matrix = eye(nper+1);
for icol=1:nper
    cumm_matrix(icol+1:nper+1,icol) = ones(nper+1-icol,1);
end

shocks_list = {'e_varphi','e_z'};
[junk,nshocks_list] = size(shocks_list);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A. shock shocks_list{kk}
for kk=1:nshocks_list;
    shock  = shocks_list{kk};
    size_shock = 1;
    resp_mat1 = [];
    resp_mat2 = [];
    resp_mat3 = [];
    fig_name  = ['Impulse responses to ',shocks_list{kk}];
    figure('name',fig_name)
    for ii=1:nvar
        eval(['y1=CITR1a_oo_.irfs.',char(varble(ii)),'_',char(shock),';']);
        y1= y1'*size_shock;
        y1=[0;y1];
        eval(['y2=CITR1b_oo_.irfs.',char(varble(ii)),'_',char(shock),';']);
        y2= y2'*size_shock;
        y2=[0;y2];
        eval(['y3=CITR1c_oo_.irfs.',char(varble(ii)),'_',char(shock),';']);
        y3= y3'*size_shock;
        y3=[0;y3];
        subplot(4,2,ii);
        if ii==5
            plot(dates,cumm_matrix*y1,'-b',dates,cumm_matrix*y2,'-.g',dates,cumm_matrix*y3,'-*r','LineWidth',2);
        else
            plot(dates,y1,'-b',dates,y2,'-.g',dates,y3,'-*r','LineWidth',2);
        end
        if ii>nvar-2
            xlabel('Quarters','Fontsize',8)
        end
        if ii==1
            legend('PCP','LCP for IM','LCP for IM & EX');
        end
        ylabel('Dev. from SS','Fontsize',8)
        title(names(ii),'Interpreter','none','Fontsize',10);
        resp_mat1 = [resp_mat1 y1];
        resp_mat2 = [resp_mat2 y2];
        resp_mat3 = [resp_mat3 y3];
    end
end
