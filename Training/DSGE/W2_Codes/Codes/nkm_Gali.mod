/*
 * This file implements the baseline New Keynesian model of Jordi Galí (2015): Monetary Policy, Inflation,
 * and the Business Cycle, Princeton University Press, Second Edition, Chapter 3
 * 
 * THIS MOD-FILE REQUIRES DYNARE 4.5 OR HIGHER
 *
 * Notes:
 *  - all model variables are expressed in deviations from steady state, i.e. in contrast to
 *      to the chapter, both the nominal interest rate and natural output are not in log-levels, but rather mean 0
 *  - in the LOM for the discount rate shock z the shock enters with a minus sign in this mod-file to generate the 
 *      IRF to a -0.5% shock
 *  - the IRF for the nominal rate in Figure 3.6 "Dynamic Responses to a Technology Shock: Money Supply Rule", p. 81
 *      is wrong. It should be identically 0 as can be seen in this mod-file and Galí's slide set accompanying this chapter
 *
 * This implementation was written by Johannes Pfeifer. In case you spot mistakes,
 * email me at jpfeifer@gmx.de
 * Modified by Hui He (ICD@IMF) on June 3, 2016
 * Modified by Felipe Zanna (ICD@IMF) on Sep 13, 2022 to make it consistent with ICD lecture
 * Please note that the following copyright notice only applies to this Dynare 
 * implementation of the model.
 * Please note that the following copyright notice only applies to this Dynare 
 * implementation of the model.
 */

/*
 * Copyright (C) 2016 Johannes Pfeifer
 *
 * This is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * It is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * For a copy of the GNU General Public License,
 * see <http://www.gnu.org/licenses/>.
 */



var pi          ${\pi}$                 (long_name='inflation')
    y_gap       ${\tilde y}$            (long_name='output gap')
    y_nat       ${y^{nat}}$             (long_name='natural output')      //(in contrast to the textbook defined in deviation from steady state)
    y           ${y}$                   (long_name='output')
    r_nat       ${r^{nat}}$             (long_name='natural interest rate')
    r_real      ${r^r}$                 (long_name='real interest rate')     
    i           ${i}$                   (long_name='nominal interrst rate')
    n           ${n}$                   (long_name='hours worked')
    m_real      ${m-p}$                 (long_name='real money stock')
    m_growth_ann ${\Delta m}$           (long_name='money growth annualized')
    nu      ${\nu}$                 (long_name='AR(1) monetary policy shock process')    
    
    a           ${a}$                   (long_name='AR(1) technology shock process')
    r_real_ann  ${r^{r,ann}}$           (long_name='annualized real interest rate')
    i_ann       ${i^{ann}}$             (long_name='annualized nominal interest rate')
    r_nat_ann   ${r^{nat,ann}}$         (long_name='annualized natural interest rate')
    pi_ann      ${\pi^{ann}}$           (long_name='annualized inflation rate')
    z           ${z}$                   (long_name='AR(1) preference shock process')
    u           ${u}$                   (long_name='AR(1) cost-push shock process')
    ;     

varexo  eps_a       ${\varepsilon_a}$       (long_name='technology shock')
        eps_nu      ${\varepsilon_\nu}$     (long_name='monetary policy shock')
        eps_z       ${\varepsilon_z}$       (long_name='preference shock innovation')
        eps_u       ${\varepsilon_u}$       (long_name='cost-push shock innovation')
       
;

parameters alppha       ${\alpha}$      (long_name='capital share')
    betta               ${\beta}$       (long_name='discount factor')
    rho_a               ${\rho_a}$      (long_name='autocorrelation technology shock')
    rho_nu              ${\rho_{\nu}}$  (long_name='autocorrelation monetary policy shock')
    rho_z               ${\rho_{z}}$    (long_name='autocorrelation preference shock')
    siggma              ${\sigma}$      (long_name='inverse EIS')
    varphi              ${\varphi}$     (long_name='inverse Frisch elasticity')
    phi_pi              ${\phi_{\pi}}$  (long_name='inflation feedback Taylor Rule')
    phi_y               ${\phi_{y}}$    (long_name='output feedback Taylor Rule')
    eta                 ${\eta}$        (long_name='semi-elasticity of money demand')
    epsilon             ${\epsilon}$    (long_name='demand elasticity')
    theta               ${\theta}$      (long_name='Calvo parameter')
    h                   ${\h}$          (long_name='habit formation parameter')
    rho_u               ${\rho_{u}}$    (long_name='autocorrelation cost-push shock')
    ;
%----------------------------------------------------------------
% Parametrization, p. 67-75
%----------------------------------------------------------------
siggma = 1;         %p. 67
varphi=5;           %p. 67, Frisch elasticity of 0.2
phi_pi = 1.5;       %p. 68 
phi_y  = 0.125;     %p. 68 (0.5/4)
theta=3/4;          %p. 67
rho_nu =0.5;        %p. 68
rho_z  = 0.5;       %p. 70
rho_a  = 0.9;       %p. 72
betta  = 0.99;      %p. 67
eta  =3.77;         %footnote 11, p. 115
alppha=1/4;     	%p. 67
epsilon=9;          %p. 67
rho_u  = 0.5;       
//h=0.8;

%----------------------------------------------------------------
% First Order Conditions
%----------------------------------------------------------------

model(linear); 
//Composite parameters
#Omega=(1-alppha)/(1-alppha+alppha*epsilon);        %defined on page 60
#psi_n_ya=(1+varphi)/(siggma*(1-alppha)+varphi+alppha);   %defined on page 62
#lambda=(1-theta)*(1-betta*theta)/theta*Omega;      %defined on page 61
#kappa=lambda*(siggma+(varphi+alppha)/(1-alppha));     %defined on page 63

% 1. New Keynesian Phillips Curve eq. (22)
pi=betta*pi(+1)+kappa*y_gap+u;
//pi=0.5*pi(-1)+0.5*betta*pi(+1)+kappa*y_gap+u; // inertia in PC curve

% 2. Dynamic IS Curve eq. (23)
y_gap=-1/siggma*(i-pi(+1)-r_nat)+y_gap(+1);
//y_gap=-(1-h)/((1+h)*siggma)*(i-pi(+1)-r_nat)+1/(1+h)*y_gap(+1)+h/(1+h)*y_gap(-1);  // IS curve for habit formation

% 3. Interest Rate Rule eq. (26) Note that the rule is defined here in terms of y_gap
i=phi_pi*pi+phi_y*y_gap+nu;
//i=0.5*i(-1)+0.5*(phi_pi*pi+phi_y*y_gap)+nu; // interest rate smoothing

% 4. Definition natural rate of interest eq. (24)
r_nat=-siggma*psi_n_ya*(1-rho_a)*a+(1-rho_z)*z;

% 5. Definition real interest rate
r_real=i-pi(+1);

% 6. Definition natural output, eq. (20)
y_nat=psi_n_ya*a;

% 7. Definition output gap
y_gap=y-y_nat;

% 8. Monetary policy shock
nu=rho_nu*nu(-1)+eps_nu;

% 9. TFP shock (eq. 6)
a=rho_a*a(-1)+eps_a;

% 10. Production function (eq. 14)
y=a+(1-alppha)*n;

% 11. Preference shock
z     = rho_z*z(-1) + eps_z; % Relative to Gali we consider a positive shock

% 12. Money growth (derived from eq. 4)
m_growth_ann=4*(y-y(-1)-eta*(i-i(-1))+pi);

% 13. Real money demand (eq. 4)
m_real=y-eta*i;
    
% 14. Annualized real interest rate
i_ann=4*i;

% 15. Annualized real interest rate
r_real_ann=4*r_real;

% 16. Annualized natural interest rate
r_nat_ann=4*r_nat;

% 17. Annualized inflation
pi_ann=4*pi;

% 18. Cost-push shock
u     = rho_u*u(-1) + eps_u; % Not in Chapter 3 in Gali (2015)

end;


%----------------------------------------------------------------
%  define shock variances
%---------------------------------------------------------------


shocks;
    var eps_nu = 0.25^2; //1 standard deviation shock of 25 basis points, i.e. 1 percentage point annualized
end;

%----------------------------------------------------------------
%  steady states: all 0 due to linear model
%---------------------------------------------------------------
resid(1);
steady;
check;

%----------------------------------------------------------------
% generate IRFs for monetary policy shock, replicates Figures 3.1, p. 69 (interest rate rule)
% 3.4, p. 76 (money supply rule)
%----------------------------------------------------------------
    stoch_simul(order = 1,irf=15) y_gap pi_ann i_ann r_real_ann m_growth_ann nu;


%----------------------------------------------------------------
% generate IRFs for discount rate shock, replicates Figures 3.2, p. 70 (interest rate rule)
% 3.5, p. 78 (money supply rule)
%----------------------------------------------------------------
shocks;
    var eps_nu = 0;   //shut off monetary policy shock
    var eps_z  = 0.5^2; //unit shock to preferences 
end;

stoch_simul(order = 1,irf=15,irf_plot_threshold=0) y_gap pi_ann i_ann r_real_ann m_growth_ann z;



%----------------------------------------------------------------
% generate IRFs, replicates Figures 3.3, p. 73 (interest rate rule)
% 3.6, p. 81 (money supply rule)
%----------------------------------------------------------------
shocks;
        var eps_z = 0;   //shut off preference shock
        var eps_a  = 1^2; //unit shock to technology
end;

stoch_simul(order = 1,irf=15,irf_plot_threshold=0) y_gap pi_ann y n i_ann r_real_ann m_growth_ann m_real a;

%----------------------------------------------------------------
% generate IRFs, (interest rate rule)
%----------------------------------------------------------------
shocks;
        var eps_a = 0;   //shut off shock to technology
        var eps_u  = 1^2; //unit cost-push shock
end;

stoch_simul(order = 1,irf=15,irf_plot_threshold=0)  y_gap pi_ann i_ann r_real_ann m_growth_ann u;


