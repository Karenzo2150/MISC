/*
 * This file extends Bernanke, Gertler and Gilchrist (1998) to an Open Economy Context
 * "The Financial Accelerator in a Quantitative Business Cycle Framework"
 * NBER WP # 6455
 * VERSION WITHOUT THE FINANCIAL ACCELERATOR ACTIVATED
 * MODIFIED VERSION IN NOVEMBER 2013 BASED ON bgg1_model0.mod:
 *      - ASSUME gamma*ALPHA_omega*RK ~ 1 which results from WE_KSS ~0
 *      - ASSUME mu*RK/Y_K*Eomega_down ~ 0
 *      - DEBT CONTRACT IS NOMINAL and NON-CONTINGENT
 *      - REMOVE RISK SHOCK
 * ADDING WAGE RIGIDITY
 * OPEN ECONOMY SETTINGS WITH COMMODITY EXPORTS, IMPERFECT EXCHANGE RATE PASS-THROUGH, WAGE RIGIDITIES
 *      - New endogenous variables (15): yh, dh, chstar, m, x, prh, pri, prx, rer, dep, bf, yh, prf, pif, pih
 *      - New exogenous variables  (5) : rnomstar, pistar, prcostar, yco, ystar
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

var c rnom pic lab wr y mcr a g z inv k n ce rk qr sp mrs piw; //19
var yh dh chstar m x prh pri prx rer dep bf prf pif pih; //15
var rnomstar pistar prcostar yco ystar; //5
varexo e_a e_g e_z e_rnomstar e_pistar e_prcostar e_yco e_ystar; //8

parameters FINACC beta_C sigma h sigma_L alpha delta G_Y chi_inv RK YH_K epsilon I_Y K_N gamma sigma_lomega mu CE_Y C_Y nu; 
parameters theta_w chi_w eps_L;
parameters theta_h chi_h theta_f chi_f rho_i phi_pic phi_y phi_dep rho_a rho_g rho_z;
parameters alpha_I alpha_C eta_C eta_I eta_star YCO_Y NX_Y YH_Y M_Y X_Y varphi varrho BF_Y CCE_Y CHstar_Y; 
parameters rho_rnomstar rho_pistar rho_prcostar rho_yco rho_ystar;
parameters sigma_rnomstar sigma_pistar sigma_prcostar sigma_yco sigma_ystar sigma_z sigma_g sigma_a;

FINACC  = 1; //=1: under the financial accelerator; =0: w/o the financial accelerator
beta_C  = 0.995;
sigma   = 1;
h       = 0.7*0;
sigma_L = 1;
alpha   = 0.34;
delta   = 0.03;
G_Y     = 0.12;
chi_inv = 20;
RK      = ((1/beta_C)^4+0.03)^(1/4);
DEF_RATE= 0.0075;
YH_K    = (RK-(1-delta))/alpha;
epsilon = (1-delta)/RK;

YCO_Y = 0.12;
NX_Y  = 0.05;
varphi = 0.5;
alpha_C = 0.33;
alpha_I = 0.50;
eta_C   = 0.5;
eta_I   = 0.5;
eta_star= 0.5;
varrho  = 0.001;
//*************************************************************************
// Computing some shares for the Open Economy Setting
REM_Y   = varphi*YCO_Y - (NX_Y-0.0025);
BF_Y    = 1/(1/beta_C-1)*(NX_Y-varphi*YCO_Y+REM_Y);
YH_Y    = 1 - YCO_Y;
I_Y     = delta/YH_K*YH_Y;
CCE_Y   = 1 -I_Y -NX_Y -G_Y;
M_Y     = alpha_C*CCE_Y + alpha_I*I_Y;
X_Y     = NX_Y + M_Y;
CHstar_Y= X_Y - YCO_Y;
//*************************************************************************

/**********************************************/
/* Not all free parameters below **************/
/* Need to check consistency among them  ******/
/* See Matlab codes BGG_ss.m and fun_bgg_ss.m */
K_N     = 2;
B_K     = 1-1/K_N;
gamma   = 1-0.025;
[RHOSS,sigma_lomegaSS, muSS, Eomega_downSS, ALPHA_omegaSS, GAMMA_omegaSS, CE_KSS, WE_KSS, nuSS, a1SS, b1SS, a3SS, b3SS, a4SS, b4SS, a12SS, b12SS, a14SS, b14SS] = BGG_ss(beta_C,RK,delta, alpha, B_K, gamma, DEF_RATE); // Computing parameters governing the financial accelerator mechanism
RHO = RHOSS;
sigma_lomega  =sigma_lomegaSS;
mu      = muSS;
Eomega_down = Eomega_downSS;
ALPHA_omega = ALPHA_omegaSS;
GAMMA_omega = GAMMA_omegaSS;
CE_K = CE_KSS;

CE_Y    = CE_K/YH_K*YH_Y;
C_Y     = CCE_Y-CE_Y;  
nu      = nuSS; // Elasticity of the external premium to the leverage ratio defined as (q+k-n)

/*********************************************/

theta_h = 0.75;
chi_h   = 0.5;

theta_w = 0.8125;
chi_w   = 1.0;
eps_L   = 6.0;

theta_f = 0.875;
chi_f   = 1.0;

rho_i   = 0.80*0;
phi_pic = 1.5;
phi_y   = 0.125;
phi_dep = 0.0;

rho_a   = 0.95;
rho_g   = 0.95;
rho_z   = 0.00;

rho_rnomstar = 0.97;
rho_pistar   = 0.55;
rho_prcostar = 0.97;
rho_yco      = 0.95;
rho_ystar    = 0.85;

sigma_a  = 0.70;
sigma_g  = 1.50;
sigma_z  = 0.25;
sigma_rnomstar = 0.25;
sigma_pistar  = 0.125;
sigma_prcostar= 13.0;
sigma_yco     = 4.0;
sigma_ystar   = 1.0;


model (linear);
// (BGG4.1)  Aggregate demand for Home goods
YH_Y*yh = ((1-alpha_C)*CCE_Y + (1-alpha_I)*I_Y)*dh + CHstar_Y*chstar + G_Y*g;
// (BGG4.2) Domestic and private demand for Home goods
((1-alpha_C)*CCE_Y + (1-alpha_I)*I_Y)*dh = (1-alpha_C)*C_Y*c + (1-alpha_C)*CE_Y*ce -(1-alpha_C)*(C_Y+CE_Y)*eta_C*(prh) + (1-alpha_I)*I_Y*(inv -eta_I*(prh-pri));
// (BGG4.3) Foreign demand for Home goods
chstar = ystar - eta_star*(prh-rer);
// (BGG4.4) Volume of Imports
M_Y*m = alpha_C*C_Y*c + alpha_C*CE_Y*ce -alpha_C*(C_Y+CE_Y)*eta_C*(prf) + alpha_I*I_Y*(inv -eta_I*(prf-pri));
// (BGG4.5) Volume of Exports
X_Y*x = CHstar_Y*chstar + YCO_Y*yco;
// (BGG4.6) Export deflator
X_Y*prx = CHstar_Y*prh + YCO_Y*(prcostar+rer);
// (BGG4.7) Dynamic definition of the real exchange rate
rer = rer(-1) + dep + pistar - pic;
// (BGG4.8) Dynamic definition of the price of Home goods
prh = prh(-1) + pih - pic;    
// (BGG4.9). Uncovered interest parity condition
rnom = rnomstar + dep(+1) + varrho*bf;
// (BGG4.10). Balance of Payment:
BF_Y*(rer+bf) = BF_Y/beta_C*(rnomstar(-1) +(1+varrho)*bf(-1)+rer-pistar) + M_Y*(rer+m) + varphi*YCO_Y*(prcostar+rer+yco) - X_Y*(prx+x);
// (BGG4.11) Imperfect exchange rate pass-through
pif = beta_C/(1+beta_C*chi_f)*pif(+1) + chi_f/(1+beta_C*chi_f)*pif(-1) + (1-theta_f)*(1-theta_f*beta_C)/theta_f/(1+beta_C*chi_f)*(rer-prf);
// (BGG4.12) Dynamic definition of the price of Foreign goods
prf = prf(-1) + pif - pic;
// (BGG4.13) Investment goods deflator
pri = (1-alpha_I)*prh + alpha_I*prf;
// (BGG4.14) Consumption goods deflator
0 = (1-alpha_C)*prh + alpha_C*prf;
// (BGG4.15) GDP definition
y = YH_Y*yh + YCO_Y*yco;

// (BGG4.16) modified. Euler equation of consumption 
c   = -sigma*(1-h)/(1+h)*(rnom-pic(+1)) + 1/(1+h)*c(+1) + h/(1+h)*c(-1);
// (BGG4.17) consumption of entrepreneurs
ce  = n;
// (BGG4.18) spread of real return of capital over the cost of funds depend of the financial position of entrepreneurs
rk(+1) - (rnom-pic(+1)) = FINACC*sp;
// (BGG4.19) Definition of the external spread
sp = FINACC*nu*(qr+k-n);
// (BGG4.20) real return to capital
rk  = (1-epsilon)*(mcr+yh-k(-1)) + epsilon*qr - qr(-1) ;
// (BGG4.21) Investment adjust cost 
qr - pri = chi_inv*(inv-inv(-1)) - beta_C*chi_inv*(inv(+1)-inv);
// (BGG4.22) Aggregate supply of Home goods
yh = a + alpha*k(-1) + (1-alpha)*lab;
// (BGG4.23) Definition of the marginal rate of substitutio b/w labor and consumption
mrs  = sigma_L*lab + (1/sigma)*(1/(1-h))*c - (1/sigma)*(h/(1-h))*c(-1);
// (BGG4.24) Demand for labor. Modified
wr = mcr + yh - lab;
// (BGG4.25) Phillips curve
pih = beta_C/(1+beta_C*chi_h)*pih(+1) + chi_h/(1+beta_C*chi_h)*pih(-1) + (1-theta_h)*(1-theta_h*beta_C)/theta_h/(1+beta_C*chi_h)*(mcr-prh);
// (BGG4.26) Capital evolution
k = delta*inv + (1-delta)*k(-1);
// (BGG4.27) Entrepreneur's networth evolution
n = FINACC*(K_N*rk - (K_N-1)*(sp(-1) + rnom(-1) - pic) + n(-1));

// (BGG4.28) Monetary policy rule. Modified
rnom = rho_i*rnom(-1) + (1-rho_i)*phi_pic*pic + (1-rho_i)*phi_y*y + (1-rho_i)*phi_dep*dep + z;
//(BGG4.29) Phillips curve for wages
piw = chi_w*pic(-1) + (1-theta_w)*(1-theta_w*beta_C)/(theta_w*(1+eps_L*sigma_L))*(mrs-wr) + beta_C*piw(+1) -beta_C*chi_w*pic;
//(BGG4.30) Definition of the inflation of wages:
piw = wr - wr(-1) + pic;
// (BGG4.31) Government expenditure evolution
g   = rho_g*g(-1) + e_g*sigma_g;
// (BGG4.32) Productivity evolution
a   = rho_a*a(-1) + e_a*sigma_a;
// (BGG4.33) New. Monetary deviation evolution
z   = rho_z*z(-1) + e_z*sigma_z;

// (BGG4.34) Foreign interest rate evolution
rnomstar   = rho_rnomstar*rnomstar(-1) + e_rnomstar*sigma_rnomstar;
// (BGG4.35) foreign inflation evolution
pistar   = rho_pistar*pistar(-1) + e_pistar*sigma_pistar;
// (BGG4.36) commodiity price evolution (in real foreign terms)
prcostar   = rho_prcostar*prcostar(-1) + e_prcostar*sigma_prcostar;
// (BGG4.37) commodity production evolution
yco   = rho_yco*yco(-1) + e_yco*sigma_yco;
// (BGG4.38) foreign demand
ystar   = rho_ystar*ystar(-1) + e_ystar*sigma_ystar;
end;

initval;
c       = 0;
rnom    = 0;
pic     = 0;
g       = 0;
wr      = 0;
lab     = 0;
y       = 0;
a       = 0;
mcr     = 0;
z       = 0;
inv     = 0;
k       = 0;
n       = 0;
ce      = 0;
rk      = 0;
qr      = 0;
sp      = 0;
mrs     = 0;
piw      = 0;

yh      = 0;
dh      = 0;
chstar  = 0;
m       = 0;
x       = 0;
prh     = 0;
pri     = 0;
prx     = 0;
rer     = 0;
dep     = 0;
bf      = 0; 
prf     = 0;
pif     = 0; 
pih     = 0;
rnomstar= 0;
pistar  = 0;
prcostar= 0;
yco     = 0;
ystar   = 0;
end;

resid;

shocks;
var e_a; stderr 1;
var e_g; stderr 1;
var e_z; stderr 1;
var e_rnomstar; stderr 1;
var e_pistar; stderr 1;
var e_prcostar; stderr 1;
var e_yco; stderr 1;
var e_ystar; stderr 1;
end;

steady;

check;

stoch_simul(order=1,irf=24,nograph);
