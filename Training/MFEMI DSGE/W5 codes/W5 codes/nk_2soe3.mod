/*
 * This file implements a NK Model for an Open Economy.
 * This version incorporate the case of incomplete market and
 * an endogenous risk premium depending on foreign debt to 
 * generate stationarity
 * Pau Rabanal (September 2025)
 * Endogenous risk premim: Psi_t = (1 + psi_bstar*Bstar)
 * Adding the natural equilbrium under flexible prices (variables ends with "_nat")
 * Different case for the monetary/exchange rate policy
 * PEG:  Exchange rate peg (3)
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

@#define DITR   = 0
@#define CITR   = 0
@#define PEG    = 1
@#define DITR_F = 0

% define string for saving different policies
@#if DITR == 1
    case_title='domestic inflation-based Taylor rule (DITR)';
@#else
    @#if CITR ==1
         case_title='CPI inflation-based Taylor rule (CITR)';
    @#else
        @#if PEG ==1
             case_title='exchange rate peg (PEG)';
        @#else
            @#if DITR_F ==1
                 case_title='Full stabilization dom. inflation';
            @#else
                error('One case must be set to 1')
            @#endif
        @#endif
    @#endif
@#endif

var c ch cf prh rer rnom pic pih lab rw y mchr a g z cstar varphi gammaH dep bstar chstar istar pistar tb y_gap;
varexo e_a e_g e_z e_cstar e_istar e_pistar e_varphi e_gammaH;

parameters beta_C sigma alpha_c eta_c sigma_L theta_p phi_i phi_pic phi_y eta_star rho_a rho_g rho_z rho_cstar;
parameters psi_bstar rho_istar rho_pistar rho_varphi rho_gammaH;

beta_C      = 0.995;
sigma       = 1;
eta_c       = 0.5;
eta_star    = 0.5;
alpha_c     = 0.30;
sigma_L     = 1;
theta_p     = 0.75;
phi_pic     = 1.5;
phi_y       = 0.0;
phi_i       = 0.85;

psi_bstar   = 0.001;

rho_a       = 0.90;
rho_g       = 0.80;
rho_z       = 0.70;
rho_cstar   = 0.85;
rho_istar   = 0.95;
rho_pistar  = 0.90;
rho_varphi  = 0.85;
rho_gammaH  = 0.0;

//Including the natural equilibrium under flexible prices for domestic (H) goods
@#include "nk_1soe_nat.mod"

model (linear);
//(SOE.1) Domestic demand for H goods
ch  = c - eta_c*prh;
//(SOE.2) Domestic demand for F goods
cf  = c - eta_c*rer;
//(SOE.3) Price level
0   = (1-alpha_c)*prh + alpha_c*rer;
//(SOE.4) Euler equation for domestic bonds
c   = -sigma*(rnom-pic(+1)) + c(+1) + sigma*g*(1-rho_g);
//(SOE.5) Uncovered interest parity condition
rnom - pic(+1) = istar - pistar(+1) + rer(+1) - rer + psi_bstar*bstar + varphi;
//(SOE.6) Labor supply
rw  = sigma_L*lab + (1/sigma)*c;
//(SOE.7) Aggregate supply for H goods
y   = a + lab;
//(SOE.8) Phillips curve for H goods
pih = beta_C*pih(+1) + (1-theta_p)*(1-theta_p*beta_C)/theta_p*(mchr-prh) + gammaH;
//(SOE.9) Labor demand
mchr= rw - a;

//(SOE.10) Monetary/Exchange rate policy rule
@#if CITR == 1
rnom= phi_i*rnom(-1)+(1-phi_i)*(phi_pic*pic + phi_y*y) + z; // CPI inflation-based Taylor rule (CITR)
@#else
    @#if DITR ==1
    rnom= phi_i*rnom(-1)+ (1-phi_i)*(phi_pic*pih + phi_y*y) + z; // domestic inflation-based Taylor rule (DITR)
    @#else
        @#if PEG ==1
            dep=0; //exchange rate peg (PEG)
        @#else
            @#if DITR_F ==1
            pih=0;
            @#else
            
            @#endif
        @#endif
    @#endif
@#endif


//(SOE.11) Aggregate demand for H goods
y   = (1-alpha_c)*ch + alpha_c*(cstar-eta_star*(prh-rer));
//(SOE.12) CPI inflation
pic = pih + alpha_c/(1-alpha_c)*(rer-rer(-1));
//(SOE.13) Balance of payments
bstar = 1/(beta_C)*bstar(-1) + alpha_c*(rer+cf) - alpha_c*(prh + cstar-eta_star*(prh-rer)) ;
//(SOE.14) Definition of nominal devaluation
dep = rer-rer(-1) + pic - pistar;
//(SOE.15) Foreign demand for H goods
chstar = cstar - eta_star*(prh-rer);
//(SOE.16) Trade balance
tb = alpha_c*(chstar + prh - rer - cf);

//************************************//
// Exogenous shocks
//************************************//
//(SOE.17) TFP shock
a   = rho_a*a(-1) + e_a;
//(SOE.18) Preference shock
g   = rho_g*g(-1) + e_g;
//(SOE.19) MP shock
z   = rho_z*z(-1) + e_z;
//(SOE.20) Foreign demand shock
cstar  = rho_cstar*cstar(-1) + e_cstar;
//(SOE.21) foreign interest rate
istar = rho_istar*istar(-1) + e_istar;
//(SOE.22) foreign inflation
pistar = rho_pistar*pistar(-1) + e_pistar;
//(SOE.23) Exogenous country-risk premium shock
varphi = rho_varphi*varphi(-1) + e_varphi;
//(SOE.24) Cost-push shock on domestic produced goods
gammaH = rho_gammaH*gammaH(-1) + e_gammaH;
//(SOE-25) Defining output gap
y_gap = y - y_nat;
end;

initval;
c       = 0;
ch      = 0;
cf      = 0;
rnom    = 0;
pic     = 0;
pih     = 0;
rer     = 0;
prh     = 0;
g       = 0;
rw      = 0;
lab     = 0;
y       = 0;
a       = 0;
mchr    = 0;
z       = 0;
cstar   = 0;
dep     = 0;
bstar   = 0;
chstar  = 0;
istar   = 0;
pistar  = 0;
tb      = 0;
varphi  = 0;
gammaH  = 0;
y_gap   = 0;
end;

resid;

shocks;
var e_a; stderr 0.70;
var e_g; stderr 0.50;
var e_z; stderr 0.00;
var e_cstar; stderr 1.00;
var e_istar; stderr  0.25;
var e_pistar; stderr  0.25;
var e_varphi; stderr 0.00;
var e_gammaH; stderr 0.00;
end;

steady;

check;

stoch_simul(order=1,irf=24,nograph);

%Save results
@#if DITR == 1
    DITR_oo_ = oo_;
    DITR_M_ = M_;
    DITR_case_title = case_title;
    save('results2_DITR','DITR_oo_','DITR_M_','DITR_case_title');
@#else
    @#if CITR ==1
         CITR_oo_ = oo_;
         CITR_M_ = M_;
         CITR_case_title = case_title;
         save('results2_CITR','CITR_oo_','CITR_M_','CITR_case_title');
    @#else
        @#if PEG ==1
             PEG_oo_ = oo_;
             PEG_M_ = M_;
             PEG_case_title = case_title;
             save('results2_PEG','PEG_oo_','PEG_M_','PEG_case_title');
        @#else
            @#if DITR_F ==1
                 DITR_F_oo_ = oo_;
                 DITR_F_M_ = M_;
                 DITR_F_case_title = case_title;
                 save('results2_DITR_F','DITR_F_oo_','DITR_F_M_','DITR_F_case_title');
            @#else
                error('Undefined case')
            @#endif
        @#endif
    @#endif
@#endif

