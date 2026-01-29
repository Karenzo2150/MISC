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
M_.fname = 'nk_closed_est';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('nk_closed_est.log');
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
M_.param_names = char(M_.param_names, 'crec_ss');
M_.param_names_tex = char(M_.param_names_tex, 'crec\_ss');
M_.param_names_long = char(M_.param_names_long, 'crec_ss');
M_.param_names = char(M_.param_names, 'rho_a');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_a');
M_.param_names_long = char(M_.param_names_long, 'rho_a');
M_.param_names = char(M_.param_names, 'rho_g');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_g');
M_.param_names_long = char(M_.param_names_long, 'rho_g');
M_.param_names = char(M_.param_names, 'rho_z');
M_.param_names_tex = char(M_.param_names_tex, 'rho\_z');
M_.param_names_long = char(M_.param_names_long, 'rho_z');
M_.param_names = char(M_.param_names, 'rhor');
M_.param_names_tex = char(M_.param_names_tex, 'rhor');
M_.param_names_long = char(M_.param_names_long, 'rhor');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.endo_nbr = 13;
M_.param_nbr = 12;
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
erase_compiled_function('nk_closed_est_static');
erase_compiled_function('nk_closed_est_dynamic');
M_.orig_eq_nbr = 13;
M_.eq_nbr = 13;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 6 19;
 1 7 0;
 0 8 20;
 0 9 0;
 0 10 0;
 2 11 0;
 0 12 0;
 3 13 0;
 4 14 0;
 5 15 0;
 0 16 0;
 0 17 0;
 0 18 0;]';
M_.nstatic = 6;
M_.nfwrd   = 2;
M_.npred   = 5;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 5;
M_.ndynamic   = 7;
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
M_.params = NaN(12, 1);
M_.NNZDerivatives = [40; 0; -1];
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
M_.params( 12 ) = 0.3;
rhor = M_.params( 12 );
M_.params( 7 ) = 2;
infl_ss = M_.params( 7 );
M_.params( 8 ) = 2;
crec_ss = M_.params( 8 );
M_.params( 9 ) = 0.90;
rho_a = M_.params( 9 );
M_.params( 10 ) = 0.80;
rho_g = M_.params( 10 );
M_.params( 11 ) = 0;
rho_z = M_.params( 11 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 12 ) = M_.params(7);
oo_.steady_state( 11 ) = M_.params(7);
oo_.steady_state( 13 ) = M_.params(8);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
estim_params_.var_exo = zeros(0, 10);
estim_params_.var_endo = zeros(0, 10);
estim_params_.corrx = zeros(0, 11);
estim_params_.corrn = zeros(0, 11);
estim_params_.param_vals = zeros(0, 10);
estim_params_.param_vals = [estim_params_.param_vals; 1, 0.995, NaN, NaN, 2, 0.995, 0.001, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 2, 0.5031, NaN, NaN, 2, 1, 0.5, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 3, 1.1702, NaN, NaN, 2, 1, 0.5, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 4, 0.6626, NaN, NaN, 1, 0.75, 0.05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 5, 2.5765, NaN, NaN, 2, 1.5, .25, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 6, 0.0290, NaN, NaN, 2, .125, .05, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 8, 2, NaN, NaN, 3, 3, 1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 7, 2, NaN, NaN, 3, 3, 1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 9, 0.3, NaN, NaN, 1, 0.3, 0.1, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 10, 0.3, NaN, NaN, 1, 0.3, 0.1, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 1, 0.01, NaN, NaN, 2, 0.01, 0.005, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 2, 0.01, NaN, NaN, 2, 0.01, 0.005, NaN, NaN, NaN ];
estim_params_.var_exo = [estim_params_.var_exo; 3, 0.01, NaN, NaN, 2, 0.01, 0.005, NaN, NaN, NaN ];
estim_params_.param_vals = [estim_params_.param_vals; 12, 0.8, NaN, NaN, 1, 0.8, 0.1, NaN, NaN, NaN ];
options_.forecast = 8;
options_.mh_jscale = 0.53;
options_.mh_nblck = 1;
options_.mh_replic = 1000;
options_.mode_compute = 4;
options_.prior_trunc = 0;
options_.smoother = 1;
options_.datafile = 'TransformedData';
options_.mode_file = 'nk_closed_est_mode';
options_.xls_range = 'C1:E105';
options_.xls_sheet = 'Data';
options_.nobs = 104;
options_.order = 1;
var_list_ = char('rnom_obs','pic_obs','y_obs');
oo_recursive_=dynare_estimation(var_list_);
constrained_vars_ = [];
constrained_paths_ = zeros(1, 6);
constrained_vars_ = 11;
constrained_paths_(1,1)=0.1;
constrained_paths_(1,2)=0.1;
constrained_paths_(1,3)=0.1;
constrained_paths_(1,4)=0.1;
constrained_paths_(1,5)=0.1;
constrained_paths_(1,6)=0.1;
options_cond_fcst_ = struct();
options_cond_fcst_.replic = 3000;
options_cond_fcst_.parameter_set = 'posterior_mean';
options_cond_fcst_.controlled_varexo = char('e_z');
imcforecast(constrained_paths_, constrained_vars_, options_cond_fcst_);
var_list_ = char('rnom_obs','pic_obs','y_obs');
plot_icforecast(var_list_, 10,options_);
save('nk_closed_est_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('nk_closed_est_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('nk_closed_est_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('nk_closed_est_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('nk_closed_est_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('nk_closed_est_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('nk_closed_est_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
