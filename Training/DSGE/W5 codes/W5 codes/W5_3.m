%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
dynare nk_2soe1.mod
dynare nk_2soe2.mod
dynare nk_2soe3.mod
dynare nk_2soe4.mod

clear all;
clc;
%After running all different specification for the monetary/exchange rate policy
load('results2_CITR.mat');
load('results2_DITR.mat');
load('results2_PEG.mat');
load('results2_DITR_F.mat');

%Standard deviation of variables under the different regimes
SD_CITR = (diag(CITR_oo_.var)).^0.5;
SD_PEG  = (diag(PEG_oo_.var)).^0.5;
SD_DITR = (diag(DITR_oo_.var)).^0.5;
SD_DITR_F = (diag(DITR_F_oo_.var)).^0.5;

matrix_vol = [SD_CITR SD_DITR SD_PEG SD_DITR_F];
var_list = {'c','rnom','pic','pih','lab','y','rer','dep','y_gap'};
varlong_list = {'Aggregate demand', 'MP rate','CPI Inflation','Domestic Inflation','Labor','GDP','Real exchange rate','Exchange rate dep.','Output gap'};
[junk,nvar_list] = size(var_list);


i_p = zeros(nvar_list,1);
for i = 1:nvar_list
    for j = 1:CITR_M_.endo_nbr
        if (strcmp(deblank(var_list{i}),deblank(char(CITR_M_.endo_names(j,:)))))>0
            i_p(i) = j;
        end
    end
end

fprintf('\nTABLE: Cyclical properties of alternative policy regimes\n')
fprintf('%20s \t %3s \t %3s \t %3s \t %3s \n','','CITR','DITR','PEG','DITR_F')
fprintf('%20s \t %3s \t %3s \t %3s \t %3s \n','','SD%','SD%','SD%','SD%')
for ivar=1:nvar_list
    fprintf('%20s \t %3.2f \t %3.2f \t %3.2f \t %3.2f \n',varlong_list{ivar},SD_CITR(i_p(ivar),1),SD_DITR(i_p(ivar),1),SD_PEG(i_p(ivar),1),SD_DITR_F(i_p(ivar),1))
end
