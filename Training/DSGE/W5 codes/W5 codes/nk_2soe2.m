%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'nk_2soe2';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('nk_2soe2.log');
M_.exo_names = 'e_a';
M_.exo_names_tex = 'e\_a';
M_.exo_names_long = 'e_a';
M_.exo_names = char(M_.exo_names, 'e_g');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_g');
M_.exo_names_long = char(M_.exo_names_long, 'e_g');
M_.exo_names = char(M_.exo_names, 'e_z');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_z');
M_.exo_names_long = char(M_.exo_names_long, 'e_z');
M_.exo_names = char(M_.exo_names, 'e_cstar');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_cstar');
M_.exo_names_long = char(M_.exo_names_long, 'e_cstar');
M_.exo_names = char(M_.exo_names, 'e_istar');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_istar');
M_.exo_names_long = char(M_.exo_names_long, 'e_istar');
M_.exo_names = char(M_.exo_names, 'e_pistar');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_pistar');
M_.exo_names_long = char(M_.exo_names_long, 'e_pistar');
M_.exo_names = char(M_.exo_names, 'e_varphi');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_varphi');
M_.exo_names_long = char(M_.exo_names_long, 'e_varphi');
M_.exo_names = char(M_.exo_names, 'e_gammaH');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_gammaH');
M_.exo_names_long = char(M_.exo_names_long, 'e_gammaH');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'ch');
M_.endo_names_tex = char(M_.endo_names_tex, 'ch');
M_.endo_names_long = char(M_.endo_names_long, 'ch');
M_.endo_names = char(M_.endo_names, 'cf');
M_.endo_names_tex = char(M_.endo_names_tex, 'cf');
M_.endo_names_long = char(M_.endo_names_long, 'cf');
M_.endo_names = char(M_.endo_names, 'prh');
M_.endo_names_tex = char(M_.endo_names_tex, 'prh');
M_.endo_names_long = char(M_.endo_names_long, 'prh');
M_.endo_names = char(M_.endo_names, 'rer');
M_.endo_names_tex = char(M_.endo_names_tex, 'rer');
M_.endo_names_long = char(M_.endo_names_long, 'rer');
M_.endo_names = char(M_.endo_names, 'rnom');
M_.endo_names_tex = char(M_.endo_names_tex, 'rnom');
M_.endo_names_long = char(M_.endo_names_long, 'rnom');
M_.endo_names = char(M_.endo_names, 'pic');
M_.endo_names_tex = char(M_.endo_names_tex, 'pic');
M_.endo_names_long = char(M_.endo_names_long, 'pic');
M_.endo_names = char(M_.endo_names, 'pih');
M_.endo_names_tex = char(M_.endo_names_tex, 'pih');
M_.endo_names_long = char(M_.endo_names_long, 'pih');
M_.endo_names = char(M_.endo_names, 'lab');
M_.endo_names_tex = char(M_.endo_names_tex, 'lab');
M_.endo_names_long = char(M_.endo_names_long, 'lab');
M_.endo_names = char(M_.endo_names, 'rw');
M_.endo_names_tex = char(M_.endo_names_tex, 'rw');
M_.endo_names_long = char(M_.endo_names_long, 'rw');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'mchr');
M_.endo_names_tex = char(M_.endo_names_tex, 'mchr');
M_.endo_names_long = char(M_.endo_names_long, 'mchr');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'cstar');
M_.endo_names_tex = char(M_.endo_names_tex, 'cstar');
M_.endo_names_long = char(M_.endo_names_long, 'cstar');
M_.endo_names = char(M_.endo_names, 'varphi');
M_.endo_names_tex = char(M_.endo_names_tex, 'varphi');
M_.endo_names_long = char(M_.endo_names_long, 'varphi');
M_.endo_names = char(M_.endo_names, 'gammaH');
M_.endo_names_tex = char(M_.endo_names_tex, 'gammaH');
M_.endo_names_long = char(M_.endo_names_long, 'gammaH');
M_.endo_names = char(M_.endo_names, 'dep');
M_.endo_names_tex = char(M_.endo_names_tex, 'dep');
M_.endo_names_long = char(M_.endo_names_long, 'dep');
M_.endo_names = char(M_.endo_names, 'bstar');
M_.endo_names_tex = char(M_.endo_names_tex, 'bstar');
M_.endo_names_long = char(M_.endo_names_long, 'bstar');
M_.endo_names = char(M_.endo_names, 'chstar');
M_.endo_names_tex = char(M_.endo_names_tex, 'chstar');
M_.endo_names_long = char(M_.endo_names_long, 'chstar');
M_.endo_names = char(M_.endo_names, 'istar');
M_.endo_names_tex = char(M_.endo_names_tex, 'istar');
M_.endo_names_long = char(M_.endo_names_long, 'istar');
M_.endo_names = char(M_.endo_names, 'pistar');
M_.endo_names_tex = char(M_.endo_names_tex, 'pistar');
M_.endo_names_long = char(M_.endo_names_long, 'pistar');
M_.endo_names = char(M_.endo_names, 'tb');
M_.endo_names_tex = char(M_.endo_names_tex, 'tb');
M_.endo_names_long = char(M_.endo_names_long, 'tb');
M_.endo_names = char(M_.endo_names, 'y_gap');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_gap');
M_.endo_names_long = char(M_.endo_names_long, 'y_gap');
M_.endo_names = char(M_.endo_names, 'c_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'c\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'c_nat');
M_.endo_names = char(M_.endo_names, 'ch_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'ch\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'ch_nat');
M_.endo_names = char(M_.endo_names, 'cf_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'cf\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'cf_nat');
M_.endo_names = char(M_.endo_names, 'prh_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'prh\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'prh_nat');
M_.endo_names = char(M_.endo_names, 'rer_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'rer\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'rer_nat');
M_.endo_names = char(M_.endo_names, 'rnom_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'rnom\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'rnom_nat');
M_.endo_names = char(M_.endo_names, 'pic_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'pic\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'pic_nat');
M_.endo_names = char(M_.endo_names, 'lab_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'lab\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'lab_nat');
M_.endo_names = char(M_.endo_names, 'rw_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'rw\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'rw_nat');
M_.endo_names = char(M_.endo_names, 'y_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'y_nat');
M_.endo_names = char(M_.endo_names, 'mchr_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'mchr\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'mchr_nat');
M_.endo_names = char(M_.endo_names, 'dep_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'dep\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'dep_nat');
M_.endo_names = char(M_.endo_names, 'bstar_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'bstar\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'bstar_nat');
M_.endo_names = char(M_.endo_names, 'chstar_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'chstar\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'chstar_nat');
M_.endo_names = char(M_.endo_names, 'tb_nat');
M_.endo_names_tex = char(M_.endo_names_tex, 'tb\_nat');
M_.endo_names_long = char(M_.endo_names_long, 'tb_nat');
M_.endo_partitions = struct();
M_.param_names = 'beta_C';
M_.param_names_tex = 'beta\_C';
M_.param_names_long = 'beta_C';
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'alpha_c');
M_.param_names_tex = char(M_.param_names_tex, 'alpha\_c');
M_.param_names_long = char(M_.param_names_long, 'alpha_c');
M_.param_names = char(M_.param_names, 'eta_c');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_c');
M_.param_names_long = char(M_.param_names_long, 'eta_c');
M_.param_names = char(M_.param_names, 'sigma_L');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_L');
M_.param_names_long = char(M_.param_names_long, 'sigma_L');
M_.param_names = char(M_.param_names, 'theta_p');
M_.param_names_tex = char(M_.param_names_tex, 'theta\_p');
M_.param_names_long = char(M_.param_names_long, 'theta_p');
M_.param_names = char(M_.param_names, 'phi_i');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_i');
M_.param_names_long = char(M_.param_names_long, 'phi_i');
M_.param_names = char(M_.param_names, 'phi_pic');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pic');
M_.param_names_long = char(M_.param_names_long, 'phi_pic');
M_.param_names = char(M_.param_names, 'phi_y');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y');
M_.param_names_long = char(M_.param_names_long, 'phi_y');
M_.param_names = char(M_.param_names, 'eta_star');
M_.param_names_tex = char(M_.param_names_tex, 'eta\_star');
M_.param_names_long = char(M_.param_names_long, 'eta_star');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_names = char(M_.param_names, 'rho_cstar');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_cstar');
M_.param_names_long = char(M_.param_names_long, 'rho_cstar');
M_.param_names = char(M_.param_names, 'psi_bstar');
M_.param_names_tex = char(M_.param_names_tex, 'psi\_bstar');
M_.param_names_long = char(M_.param_names_long, 'psi_bstar');
M_.param_names = char(M_.param_names, 'rho_istar');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_istar');
M_.param_names_long = char(M_.param_names_long, 'rho_istar');
M_.param_names = char(M_.param_names, 'rho_pistar');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_pistar');
M_.param_names_long = char(M_.param_names_long, 'rho_pistar');
M_.param_names = char(M_.param_names, 'rho_varphi');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_varphi');
M_.param_names_long = char(M_.param_names_long, 'rho_varphi');
M_.param_names = char(M_.param_names, 'rho_gammaH');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_gammaH');
M_.param_names_long = char(M_.param_names_long, 'rho_gammaH');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 8;
M_.endo_nbr = 40;
M_.param_nbr = 19;
M_.orig_endo_nbr = 40;
M_.aux_vars = [];
M_.Sigma_e = zeros(8, 8);
M_.Correlation_matrix = eye(8, 8);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('nk_2soe2_static');
erase_compiled_function('nk_2soe2_dynamic');
M_.orig_eq_nbr = 40;
M_.eq_nbr = 40;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 14 54;
 0 15 0;
 0 16 0;
 0 17 0;
 1 18 55;
 2 19 0;
 0 20 56;
 0 21 57;
 0 22 0;
 0 23 0;
 0 24 0;
 0 25 0;
 3 26 0;
 4 27 0;
 5 28 0;
 6 29 0;
 7 30 0;
 8 31 0;
 0 32 0;
 9 33 0;
 0 34 0;
 10 35 0;
 11 36 58;
 0 37 0;
 0 38 0;
 0 39 59;
 0 40 0;
 0 41 0;
 0 42 0;
 12 43 60;
 0 44 0;
 0 45 61;
 0 46 0;
 0 47 0;
 0 48 0;
 0 49 0;
 0 50 0;
 13 51 0;
 0 52 0;
 0 53 0;]';
M_.nstatic = 22;
M_.nfwrd   = 5;
M_.npred   = 10;
M_.nboth   = 3;
M_.nsfwrd   = 8;
M_.nspred   = 13;
M_.ndynamic   = 18;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:8];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(40, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(8, 1);
M_.params = NaN(19, 1);
M_.NNZDerivatives = [156; -1; -1];
case_title='domestic inflation-based Taylor rule (DITR)';
M_.params( 1 ) = 0.995;
beta_C = M_.params( 1 );
M_.params( 2 ) = 1;
sigma = M_.params( 2 );
M_.params( 4 ) = 0.5;
eta_c = M_.params( 4 );
M_.params( 10 ) = 0.5;
eta_star = M_.params( 10 );
M_.params( 3 ) = 0.30;
alpha_c = M_.params( 3 );
M_.params( 5 ) = 1;
sigma_L = M_.params( 5 );
M_.params( 6 ) = 0.75;
theta_p = M_.params( 6 );
M_.params( 8 ) = 1.5;
phi_pic = M_.params( 8 );
M_.params( 9 ) = 0.0;
phi_y = M_.params( 9 );
M_.params( 7 ) = 0.85;
phi_i = M_.params( 7 );
M_.params( 15 ) = 0.001;
psi_bstar = M_.params( 15 );
M_.params( 11 ) = 0.90;
rho_a = M_.params( 11 );
M_.params( 12 ) = 0.80;
rho_g = M_.params( 12 );
M_.params( 13 ) = 0.70;
rho_z = M_.params( 13 );
M_.params( 14 ) = 0.85;
rho_cstar = M_.params( 14 );
M_.params( 16 ) = 0.95;
rho_istar = M_.params( 16 );
M_.params( 17 ) = 0.90;
rho_pistar = M_.params( 17 );
M_.params( 18 ) = 0.85;
rho_varphi = M_.params( 18 );
M_.params( 19 ) = 0.0;
rho_gammaH = M_.params( 19 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 26 ) = 0;
oo_.steady_state( 27 ) = 0;
oo_.steady_state( 28 ) = 0;
oo_.steady_state( 31 ) = 0;
oo_.steady_state( 32 ) = 0;
oo_.steady_state( 30 ) = 0;
oo_.steady_state( 29 ) = 0;
oo_.steady_state( 34 ) = 0;
oo_.steady_state( 33 ) = 0;
oo_.steady_state( 35 ) = 0;
oo_.steady_state( 36 ) = 0;
oo_.steady_state( 37 ) = 0;
oo_.steady_state( 38 ) = 0;
oo_.steady_state( 39 ) = 0;
oo_.steady_state( 40 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 14 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 11 ) = 0;
oo_.steady_state( 13 ) = 0;
oo_.steady_state( 12 ) = 0;
oo_.steady_state( 15 ) = 0;
oo_.steady_state( 16 ) = 0;
oo_.steady_state( 19 ) = 0;
oo_.steady_state( 20 ) = 0;
oo_.steady_state( 21 ) = 0;
oo_.steady_state( 22 ) = 0;
oo_.steady_state( 23 ) = 0;
oo_.steady_state( 24 ) = 0;
oo_.steady_state( 17 ) = 0;
oo_.steady_state( 18 ) = 0;
oo_.steady_state( 25 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
resid;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.70)^2;
M_.Sigma_e(2, 2) = (0.50)^2;
M_.Sigma_e(3, 3) = (0.00)^2;
M_.Sigma_e(4, 4) = (1.00)^2;
M_.Sigma_e(5, 5) = (0.25)^2;
M_.Sigma_e(6, 6) = (0.25)^2;
M_.Sigma_e(7, 7) = (0.00)^2;
M_.Sigma_e(8, 8) = (0.00)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.irf = 24;
options_.nograph = 1;
options_.order = 1;
var_list_ = char();
info = stoch_simul(var_list_);
DITR_oo_ = oo_;
DITR_M_ = M_;
DITR_case_title = case_title;
save('results2_DITR','DITR_oo_','DITR_M_','DITR_case_title');
save('nk_2soe2_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('nk_2soe2_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('nk_2soe2_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('nk_2soe2_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('nk_2soe2_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('nk_2soe2_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('nk_2soe2_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
