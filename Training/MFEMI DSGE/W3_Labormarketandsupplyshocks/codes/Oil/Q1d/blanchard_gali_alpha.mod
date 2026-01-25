%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% INTERNATIONAL MONETARY FUND - Institute for Capacity Development
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Course on Monetary and Fiscal Policy Analysis with DSGE Models 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Joint Vienna Institute (JVI)
%% Vienna, Austria 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% September 29-October 10, 2025
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% This file generates the simulation for the Blanchard-Gali (2007) model, oil price shocks
%% ... Alternative calibrations for price indexation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Contact
%% Pau Rabanal: PRabanal@IMF.org
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

var q lab m c c_q c_m pic piq rnom rw a rm;
varexo e_a e_rm;

parameters beta_C alpha chi gamma sigma sigma_L theta_p alpha_p phi_piq mkp eta rho_a rho_rm;

beta_C  = 0.99;
alpha   = 0.012;
chi     = 0.017;
gamma   = 0;
sigma   = 1;
sigma_L = 1;
theta_p = 0.75;
alpha_p   = 1;
phi_piq = 1.5;
mkp     = 1.2;
eta     = alpha/(mkp-alpha);

rho_a   = 0.95;
rho_rm   = 0.97;

model (linear);
q   = a +(1-alpha)*lab+alpha*m;
c   = (1-chi)*c_q+chi*c_m;
pic = piq + chi*(rm-rm(-1));
rw  = (1-chi)*rm + m - lab;
rm  = c_q-c_m;
rw  = gamma*rw(-1)+(1-gamma)*(sigma_L*lab + (1/sigma)*c);
c   = -sigma*(rnom-pic(+1)) + c(+1);
rnom= phi_piq*piq;
piq-alpha_p*piq(-1) = beta_C*(piq(+1)-alpha_p*piq) + (1-theta_p)*(1-theta_p*beta_C)/theta_p*((1-alpha)*rw+(alpha+(1-alpha)*chi)*rm-a);
c   = q-chi*rm-eta*((1-alpha)*rw+(alpha+(1-alpha)*chi)*rm-a);
a   = rho_a*a(-1) + e_a;
rm   = rho_rm*rm(-1) + e_rm;
end;

steady;
check;

shocks;
var e_a;stderr .01;
var e_rm;stderr .16;
end;

stoch_simul(irf=12, nograph) q c pic piq rw rm lab c_q c_m rnom;