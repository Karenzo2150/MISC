/*
 * This file implements a NK Model for an Open Economy.
 * This version incorporate the case of incomplete market and
 * an endogenous risk premium depending on foreign debt to 
 * generate stationarity
 * Pau Rabanal (September 2025)
 * Endogenous risk premim: Psi_t = (1 + psi_bstar*Bstar)
 * Different case for the monetary/exchange rate policy
 * Natural equilibrium under flexible domestic prices
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

var c_nat ch_nat cf_nat prh_nat rer_nat rnom_nat pic_nat lab_nat rw_nat y_nat mchr_nat dep_nat bstar_nat chstar_nat tb_nat;


model (linear);
//(SOE_NAT.1) Domestic demand for H goods
ch_nat  = c_nat - eta_c*prh_nat;
//(SOE_NAT.2) Domestic demand for F goods
cf_nat  = c_nat - eta_c*rer_nat;
//(SOE_NAT.3) Price level
0   = (1-alpha_c)*prh_nat + alpha_c*rer_nat;
//(SOE_NAT.4) Euler equation for domestic bonds
c_nat   = -sigma*(rnom_nat-pic_nat(+1)) + c_nat(+1) + sigma*g*(1-rho_g);
//(SOE_NAT.5) Uncovered interest parity condition
rnom_nat - pic_nat(+1) = istar - pistar(+1) + rer_nat(+1) - rer_nat + psi_bstar*bstar_nat + varphi;
//(SOE_NAT.6) Labor supply
rw_nat  = sigma_L*lab_nat + (1/sigma)*c_nat;
//(SOE_NAT.7) Aggregate supply for H goods
y_nat   = a + lab_nat;
//(SOE_NAT.8)
0 = mchr_nat-prh_nat;
//(SOE_NAT.9) Labor demand
mchr_nat= rw_nat - a;
//(SOE_NAT.10) Aggregate demand for H goods
y_nat   = (1-alpha_c)*ch_nat + alpha_c*(cstar-eta_star*(prh_nat-rer_nat));
//(SOE_NAT.11) CPI inflation
pic_nat = alpha_c/(1-alpha_c)*(rer_nat-rer_nat(-1));
//(SOE_NAT.12) Balance of payments
bstar_nat = 1/(beta_C)*bstar_nat(-1) + alpha_c*(rer_nat+cf_nat) - alpha_c*(prh_nat + cstar-eta_star*(prh_nat-rer_nat)) ;
//(SOE_NAT.13) Definition of nominal devaluation
dep_nat = rer_nat-rer_nat(-1) + pic_nat - pistar;
//(SOE_NAT.14) Foreign demand for H goods
chstar_nat = cstar - eta_star*(prh_nat-rer_nat);
//(SOE_NAT.15) Trade balance
tb_nat = alpha_c*(chstar_nat + prh_nat - rer_nat - cf_nat);
end;

initval;
c_nat       = 0;
ch_nat      = 0;
cf_nat      = 0;
rnom_nat    = 0;
pic_nat     = 0;
rer_nat     = 0;
prh_nat     = 0;
rw_nat      = 0;
lab_nat     = 0;
y_nat       = 0;
mchr_nat    = 0;
dep_nat     = 0;
bstar_nat   = 0;
chstar_nat  = 0;
tb_nat      = 0;
end;

