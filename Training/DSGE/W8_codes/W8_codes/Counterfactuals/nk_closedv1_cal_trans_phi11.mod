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
sigma   = 0.4912;
sigma_L = 1.122;
theta_p = 0.7082;
//phi_pic = 2.2658;  %% Se substituye la regla de politica monetaria
phi_pic = 1.1;
phi_y   = 0.0451;

rho_a   = 0.9943;
rho_g   = 0.9434;
rho_z   = 0.6125;

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

shocks;
  var e_a=0.0091^2;
  var e_g=0.0149^2;
  var e_z=0.0033^2;
end;
stoch_simul(order=1, irf=24, nograph, noprint);