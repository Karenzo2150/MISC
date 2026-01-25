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
M_.fname = 'basic_nk';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('basic_nk.log');
M_.exo_names = 'EPS_A';
M_.exo_names_tex = 'EPS\_A';
M_.exo_names_long = 'EPS_A';
M_.exo_names = char(M_.exo_names, 'EPS_C');
M_.exo_names_tex = char(M_.exo_names_tex, 'EPS\_C');
M_.exo_names_long = char(M_.exo_names_long, 'EPS_C');
M_.exo_names = char(M_.exo_names, 'EPS_PI');
M_.exo_names_tex = char(M_.exo_names_tex, 'EPS\_PI');
M_.exo_names_long = char(M_.exo_names_long, 'EPS_PI');
M_.exo_names = char(M_.exo_names, 'EPS_INT');
M_.exo_names_tex = char(M_.exo_names_tex, 'EPS\_INT');
M_.exo_names_long = char(M_.exo_names_long, 'EPS_INT');
M_.endo_names = 'X';
M_.endo_names_tex = 'X';
M_.endo_names_long = 'X';
M_.endo_names = char(M_.endo_names, 'MC');
M_.endo_names_tex = char(M_.endo_names_tex, 'MC');
M_.endo_names_long = char(M_.endo_names_long, 'MC');
M_.endo_names = char(M_.endo_names, 'W');
M_.endo_names_tex = char(M_.endo_names_tex, 'W');
M_.endo_names_long = char(M_.endo_names_long, 'W');
M_.endo_names = char(M_.endo_names, 'PI');
M_.endo_names_tex = char(M_.endo_names_tex, 'PI');
M_.endo_names_long = char(M_.endo_names_long, 'PI');
M_.endo_names = char(M_.endo_names, 'INT');
M_.endo_names_tex = char(M_.endo_names_tex, 'INT');
M_.endo_names_long = char(M_.endo_names_long, 'INT');
M_.endo_names = char(M_.endo_names, 'YN');
M_.endo_names_tex = char(M_.endo_names_tex, 'YN');
M_.endo_names_long = char(M_.endo_names_long, 'YN');
M_.endo_names = char(M_.endo_names, 'RN');
M_.endo_names_tex = char(M_.endo_names_tex, 'RN');
M_.endo_names_long = char(M_.endo_names_long, 'RN');
M_.endo_names = char(M_.endo_names, 'Y');
M_.endo_names_tex = char(M_.endo_names_tex, 'Y');
M_.endo_names_long = char(M_.endo_names_long, 'Y');
M_.endo_names = char(M_.endo_names, 'L');
M_.endo_names_tex = char(M_.endo_names_tex, 'L');
M_.endo_names_long = char(M_.endo_names_long, 'L');
M_.endo_names = char(M_.endo_names, 'A');
M_.endo_names_tex = char(M_.endo_names_tex, 'A');
M_.endo_names_long = char(M_.endo_names_long, 'A');
M_.endo_names = char(M_.endo_names, 'XI_C');
M_.endo_names_tex = char(M_.endo_names_tex, 'XI\_C');
M_.endo_names_long = char(M_.endo_names_long, 'XI_C');
M_.endo_names = char(M_.endo_names, 'XI_PI');
M_.endo_names_tex = char(M_.endo_names_tex, 'XI\_PI');
M_.endo_names_long = char(M_.endo_names_long, 'XI_PI');
M_.endo_names = char(M_.endo_names, 'XI_INT');
M_.endo_names_tex = char(M_.endo_names_tex, 'XI\_INT');
M_.endo_names_long = char(M_.endo_names_long, 'XI_INT');
M_.endo_partitions = struct();
M_.param_names = 'SIGMA';
M_.param_names_tex = 'SIGMA';
M_.param_names_long = 'SIGMA';
M_.param_names = char(M_.param_names, 'VARPHI');
M_.param_names_tex = char(M_.param_names_tex, 'VARPHI');
M_.param_names_long = char(M_.param_names_long, 'VARPHI');
M_.param_names = char(M_.param_names, 'BETA');
M_.param_names_tex = char(M_.param_names_tex, 'BETA');
M_.param_names_long = char(M_.param_names_long, 'BETA');
M_.param_names = char(M_.param_names, 'OMEGA');
M_.param_names_tex = char(M_.param_names_tex, 'OMEGA');
M_.param_names_long = char(M_.param_names_long, 'OMEGA');
M_.param_names = char(M_.param_names, 'ALPHA');
M_.param_names_tex = char(M_.param_names_tex, 'ALPHA');
M_.param_names_long = char(M_.param_names_long, 'ALPHA');
M_.param_names = char(M_.param_names, 'EPSILON');
M_.param_names_tex = char(M_.param_names_tex, 'EPSILON');
M_.param_names_long = char(M_.param_names_long, 'EPSILON');
M_.param_names = char(M_.param_names, 'KAPPA');
M_.param_names_tex = char(M_.param_names_tex, 'KAPPA');
M_.param_names_long = char(M_.param_names_long, 'KAPPA');
M_.param_names = char(M_.param_names, 'PHI_PI');
M_.param_names_tex = char(M_.param_names_tex, 'PHI\_PI');
M_.param_names_long = char(M_.param_names_long, 'PHI_PI');
M_.param_names = char(M_.param_names, 'PHI_X');
M_.param_names_tex = char(M_.param_names_tex, 'PHI\_X');
M_.param_names_long = char(M_.param_names_long, 'PHI_X');
M_.param_names = char(M_.param_names, 'RHO_C');
M_.param_names_tex = char(M_.param_names_tex, 'RHO\_C');
M_.param_names_long = char(M_.param_names_long, 'RHO_C');
M_.param_names = char(M_.param_names, 'RHO_PI');
M_.param_names_tex = char(M_.param_names_tex, 'RHO\_PI');
M_.param_names_long = char(M_.param_names_long, 'RHO_PI');
M_.param_names = char(M_.param_names, 'RHO_A');
M_.param_names_tex = char(M_.param_names_tex, 'RHO\_A');
M_.param_names_long = char(M_.param_names_long, 'RHO_A');
M_.param_names = char(M_.param_names, 'RHO_INT');
M_.param_names_tex = char(M_.param_names_tex, 'RHO\_INT');
M_.param_names_long = char(M_.param_names_long, 'RHO_INT');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 13;
M_.param_nbr = 13;
M_.orig_endo_nbr = 13;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.linear = 1;
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('basic_nk_static');
erase_compiled_function('basic_nk_dynamic');
M_.orig_eq_nbr = 13;
M_.eq_nbr = 13;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 5 18;
 0 6 0;
 0 7 0;
 0 8 19;
 0 9 0;
 0 10 20;
 0 11 0;
 0 12 0;
 0 13 0;
 1 14 0;
 2 15 21;
 3 16 0;
 4 17 0;]';
M_.nstatic = 6;
M_.nfwrd   = 3;
M_.npred   = 3;
M_.nboth   = 1;
M_.nsfwrd   = 4;
M_.nspred   = 4;
M_.ndynamic   = 7;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(13, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(13, 1);
M_.NNZDerivatives = [43; 0; -1];
M_.params( 3 ) = 0.995;
BETA = M_.params( 3 );
M_.params( 1 ) = 2;
SIGMA = M_.params( 1 );
M_.params( 2 ) = 1;
VARPHI = M_.params( 2 );
M_.params( 5 ) = 0;
ALPHA = M_.params( 5 );
0.4;
THETA   = 0.75;
M_.params( 6 ) = 6;
EPSILON = M_.params( 6 );
M_.params( 7 ) = (1-THETA)*(1-THETA*M_.params(3))/THETA*1/(1+M_.params(6)*M_.params(5)/(1-M_.params(5)));
KAPPA = M_.params( 7 );
M_.params( 8 ) = 2.5;
PHI_PI = M_.params( 8 );
M_.params( 9 ) = 0;
PHI_X = M_.params( 9 );
0.5;
M_.params( 10 ) = 0.85;
RHO_C = M_.params( 10 );
M_.params( 11 ) = 0.75;
RHO_PI = M_.params( 11 );
M_.params( 12 ) = 0.9;
RHO_A = M_.params( 12 );
M_.params( 13 ) = 0.85;
RHO_INT = M_.params( 13 );
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.Sigma_e(4, 4) = (1)^2;
options_.irf = 20;
options_.nograph = 1;
var_list_ = char();
info = stoch_simul(var_list_);
save('basic_nk_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('basic_nk_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('basic_nk_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('basic_nk_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('basic_nk_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('basic_nk_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('basic_nk_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
