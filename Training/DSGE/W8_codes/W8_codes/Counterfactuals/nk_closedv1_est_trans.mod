/*
 * This file implements a NK Model for a Closed Economy.
 *
 */

/*
 * Dynare is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Dynare is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Dynare.  If not, see <http://www.gnu.org/licenses/>.
 */

var c rnom pic lab rw y mc a g z rnom_obs pic_obs y_obs;
varexo e_a e_g e_z;

parameters beta_C sigma sigma_L theta_p phi_pic phi_y rho_a rho_g rho_z;

beta_C  = 0.995;
sigma   = 1;
sigma_L = 1;
theta_p = 0.75;
phi_pic = 1.5;
phi_y   = 0.125;

rho_a   = 0.90;
rho_g   = 0.80;
rho_z   = 0.70;


model (linear);
c   = -sigma*(rnom-pic(+1)) + c(+1)  + g*(1-rho_g)*sigma;
rw  = sigma_L*lab + (1/sigma)*c;
y   = a + lab;
pic = beta_C*pic(+1) + (1-theta_p)*(1-theta_p*beta_C)/theta_p*mc;
mc = rw - a;
rnom= phi_pic*pic + phi_y*y + z;
y   = c;
a   = rho_a*a(-1) + e_a;
g   = rho_g*g(-1) + e_g;
z   = rho_z*z(-1) + e_z;

rnom_obs=rnom;
pic_obs=pic;
y_obs=y;
end;

steady;
check;

estimated_params;
beta_C,0.995,,,GAMMA_PDF,0.995,0.001;
sigma,1,,,GAMMA_PDF,1,0.5;
sigma_L,1,,,GAMMA_PDF,1,0.5;
theta_p,0.75,,,BETA_PDF,0.75,0.05;
phi_pic,1.5,,,GAMMA_PDF,1.5,.25;
phi_y,.125,,,GAMMA_PDF,.125,.05;

rho_a,0.9,,,BETA_PDF,0.8,0.1;
rho_g,0.8,,,BETA_PDF,0.8,0.1;
rho_z,0.7,,,BETA_PDF,0.8,0.1;
stderr e_a,0.01,,,GAMMA_PDF,0.01,0.005;
stderr e_g,0.01,,,GAMMA_PDF,0.01,0.005;
stderr e_z,0.01,,,GAMMA_PDF,0.01,0.005;
end;

varobs rnom_obs pic_obs y_obs;
//estimation(datafile=datos_trans,mh_replic=25000,mh_nblocks=1,mh_jscale=0.3,mh_drop=0.2,prior_trunc=1e-32, nodiagnostic, graph_format = none);
estimation(datafile=datos_trans,mh_replic=25000,mode_file=nk_closedv1_est_trans_mode,mh_nblocks=1,mh_jscale=0.5,mh_drop=0.2,prior_trunc=1e-32, smoother, nodiagnostic);
shock_decomposition rnom_obs pic_obs y_obs;