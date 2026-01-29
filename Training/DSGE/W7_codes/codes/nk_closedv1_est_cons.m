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
M_.fname = 'nk_closedv1_est_cons';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('nk_closedv1_est_cons.log');
M_.exo_names = 'e_a';
M_.exo_names_tex = 'e\_a';
M_.exo_names_long = 'e_a';
M_.exo_names = char(M_.exo_names, 'e_g');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_g');
M_.exo_names_long = char(M_.exo_names_long, 'e_g');
M_.exo_names = char(M_.exo_names, 'e_z');
M_.exo_names_tex = char(M_.exo_names_tex, 'e\_z');
M_.exo_names_long = char(M_.exo_names_long, 'e_z');
M_.endo_names = 'c';
M_.endo_names_tex = 'c';
M_.endo_names_long = 'c';
M_.endo_names = char(M_.endo_names, 'rnom');
M_.endo_names_tex = char(M_.endo_names_tex, 'rnom');
M_.endo_names_long = char(M_.endo_names_long, 'rnom');
M_.endo_names = char(M_.endo_names, 'pic');
M_.endo_names_tex = char(M_.endo_names_tex, 'pic');
M_.endo_names_long = char(M_.endo_names_long, 'pic');
M_.endo_names = char(M_.endo_names, 'lab');
M_.endo_names_tex = char(M_.endo_names_tex, 'lab');
M_.endo_names_long = char(M_.endo_names_long, 'lab');
M_.endo_names = char(M_.endo_names, 'rw');
M_.endo_names_tex = char(M_.endo_names_tex, 'rw');
M_.endo_names_long = char(M_.endo_names_long, 'rw');
M_.endo_names = char(M_.endo_names, 'y');
M_.endo_names_tex = char(M_.endo_names_tex, 'y');
M_.endo_names_long = char(M_.endo_names_long, 'y');
M_.endo_names = char(M_.endo_names, 'mc');
M_.endo_names_tex = char(M_.endo_names_tex, 'mc');
M_.endo_names_long = char(M_.endo_names_long, 'mc');
M_.endo_names = char(M_.endo_names, 'a');
M_.endo_names_tex = char(M_.endo_names_tex, 'a');
M_.endo_names_long = char(M_.endo_names_long, 'a');
M_.endo_names = char(M_.endo_names, 'g');
M_.endo_names_tex = char(M_.endo_names_tex, 'g');
M_.endo_names_long = char(M_.endo_names_long, 'g');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'rnom_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'rnom\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'rnom_obs');
M_.endo_names = char(M_.endo_names, 'pic_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'pic\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'pic_obs');
M_.endo_names = char(M_.endo_names, 'y_obs');
M_.endo_names_tex = char(M_.endo_names_tex, 'y\_obs');
M_.endo_names_long = char(M_.endo_names_long, 'y_obs');
M_.endo_partitions = struct();
M_.param_names = 'beta_C';
M_.param_names_tex = 'beta\_C';
M_.param_names_long = 'beta_C';
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'sigma_L');
M_.param_names_tex = char(M_.param_names_tex, 'sigma\_L');
M_.param_names_long = char(M_.param_names_long, 'sigma_L');
M_.param_names = char(M_.param_names, 'theta_p');
M_.param_names_tex = char(M_.param_names_tex, 'theta\_p');
M_.param_names_long = char(M_.param_names_long, 'theta_p');
M_.param_names = char(M_.param_names, 'phi_pic');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_pic');
M_.param_names_long = char(M_.param_names_long, 'phi_pic');
M_.param_names = char(M_.param_names, 'phi_y');
M_.param_names_tex = char(M_.param_names_tex, 'phi\_y');
M_.param_names_long = char(M_.param_names_long, 'phi_y');
M_.param_names = char(M_.param_names, 'infl_ss');
M_.param_names_tex = char(M_.param_names_tex, 'infl\_ss');
M_.param_names_long = char(M_.param_names_long, 'infl_ss');
M_.param_names = char(M_.param_names, 'growth_ss');
M_.param_names_tex = char(M_.param_names_tex, 'growth\_ss');
M_.param_names_long = char(M_.param_names_long, 'growth_ss');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 13;
M_.param_nbr = 11;
M_.orig_endo_nbr = 13;
M_.aux_vars = [];
options_.varobs = cell(1);
options_.varobs(1)  = {'rnom_obs'};
options_.varobs(2)  = {'pic_obs'};
options_.varobs(3)  = {'y_obs'};
options_.varobs_id = [ 11 12 13  ];
M_.Sigma_e = zeros(3, 3);
M_.Correlation_matrix = eye(3, 3);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('nk_closedv1_est_cons_static');
erase_compiled_function('nk_closedv1_est_cons_dynamic');
M_.orig_eq_nbr = 13;
M_.eq_nbr = 13;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 5 18;
 0 6 0;
 0 7 19;
 0 8 0;
 0 9 0;
 1 10 0;
 0 11 0;
 2 12 0;
 3 13 0;
 4 14 0;
 0 15 0;
 0 16 0;
 0 17 0;]';
M_.nstatic = 7;
M_.nfwrd   = 2;
M_.npred   = 4;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 4;
M_.ndynamic   = 6;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(13, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = NaN(11, 1);
M_.NNZDerivatives = [39; 0; -1];
M_.params( 1 ) = 0.995;
beta_C = M_.params( 1 );
M_.params( 2 ) = 1;
sigma = M_.params( 2 );
M_.params( 3 ) = 1;
sigma_L = M_.params( 3 );
M_.params( 4 ) = 0.75;
theta_p = M_.params( 4 );
M_.params( 5 ) = 1.5;
phi_pic = M_.params( 5 );
M_.params( 6 ) = 0.125;
phi_y = M_.params( 6 );
M_.params( 7 ) = 2;
infl_ss = M_.params( 7 );
M_.params( 8 ) = 2;
growth_ss = M_.params( 8 );
M_.params( 9 ) = 0.90;
rho_a = M_.params( 9 );
M_.params( 10 ) = 0.80;
rho_g = M_.params( 10 );
M_.params( 11 ) = 0.70;
rho_z = M_.params( 11 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (0.01)^2;
M_.Sigma_e(2, 2) = (0.01)^2;
M_.Sigma_e(3, 3) = (0.01)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
estim_params_.var_exo = zeros(0, 10);
estim_params_.var_endo = zeros(0, 10);
estim_params_.corrx = zeros(0, 11);
estim_params_.corrn = zeros(0, 11);
estim_params_.param_vals = zeros(0, 10);
estim_params_.param_vals = [estim_params_.param_vals; 1, 0.995, NaN, NaN, 2, 0.995, 0.001, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, 1, NaN, NaN, 2, 1, 0.5, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, 1, NaN, NaN, 2, 1, 0.5, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, 0.75, NaN, NaN, 1, 0.75, 0.05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 5, 1.5, NaN, NaN, 2, 1.5, .25, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 6, .125, NaN, NaN, 2, .125, .05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 8, 2, NaN, NaN, 3, 3, 1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 7, 2, NaN, NaN, 3, 3, 1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 9, 0.9, NaN, NaN, 1, 0.8, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 10, 0.8, NaN, NaN, 1, 0.8, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 11, 0.7, NaN, NaN, 1, 0.8, 0.1, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 1, 0.01, NaN, NaN, 2, 0.01, 0.005, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 2, 0.01, NaN, NaN, 2, 0.01, 0.005, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 3, 0.01, NaN, NaN, 2, 0.01, 0.005, NaN, NaN, NaN ];
options_.mh_drop = 0.2;
options_.mh_jscale = 0.3;
options_.mh_nblck = 1;
options_.mh_replic = 5000;
options_.nodiagnostic = 1;
options_.prior_trunc = 0;
options_.datafile = 'data_cons.csv';
options_.graph_format = char('none');
options_.order = 1;
var_list_ = char();
oo_recursive_=dynare_estimation(var_list_);
var_list_ = char('rnom_obs','pic_obs','y_obs');
[oo_,M_]= shock_decomposition(M_,oo_,options_,var_list_,bayestopt_,estim_params_);
save('nk_closedv1_est_cons_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('nk_closedv1_est_cons_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('nk_closedv1_est_cons_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('nk_closedv1_est_cons_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('nk_closedv1_est_cons_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('nk_closedv1_est_cons_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('nk_closedv1_est_cons_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
