%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;

dynare nk_1soe1.mod %Running baseline model under CITR

clear all;
load('results1_CITR.mat'); %loading results of the baseline model under CITR

varble = {'rnom','y','pic','rer','dep','pih','chstar','cf'};
names  ={'Nominal interest rate','GDP', 'CPI inflation','Real exchange rate','Exchange rate','Domestic inflation','Exports','Imports'};
[nper,junk1] = size(CITR_oo_.irfs.rnom_e_z');
nvar = length(varble);
dates = (0:1:nper)';

cumm_matrix = eye(nper+1);
for icol=1:nper
    cumm_matrix(icol+1:nper+1,icol) = ones(nper+1-icol,1);
end

shocks_list = {'e_g','e_cstar','e_gammaH','e_z','e_a'};
[junk,nshocks_list] = size(shocks_list);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A. shock shocks_list{kk}
for kk=1:nshocks_list;
    shock  = shocks_list{kk};
    size_shock = 1;
    resp_mat1 = [];
    fig_name  = ['Impulse responses to ',shocks_list{kk}];
    figure('name',fig_name)
    for ii=1:nvar
        eval(['y1=CITR_oo_.irfs.',char(varble(ii)),'_',char(shock),';']);
        y1= y1'*size_shock;
        y1=[0;y1];
        subplot(4,2,ii);
        if ii==5 % Plot level of the nominal exchange rate
            plot(dates,cumm_matrix*y1,'LineWidth',2);
        else
            plot(dates,y1,'LineWidth',2);
        end
        if ii>nvar-2
            xlabel('Quarters','Fontsize',8)
        end
        ylabel('Dev. from SS','Fontsize',8)
        title(names(ii),'Interpreter','none','Fontsize',10);
        resp_mat1 = [resp_mat1 y1];
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


