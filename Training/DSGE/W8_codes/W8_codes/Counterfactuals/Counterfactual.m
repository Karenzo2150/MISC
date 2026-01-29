% Ejercicio contrafactual: Regla de politica monetaria distinta en el
% modelo NK basico

% Obtencion de los shocks del modelo estimado
% dynare nk_closedv1_est_trans.mod
 load('nk_closedv1_est_trans_results.mat');

 T=size(oo_.SmoothedShocks.Mean.e_a,1);
 
% Simulacion con todos los shocks mas efecto de la condicion inicial
% Margen

% Condicion inicial en el primer periodo

y0=[oo_.SmoothedVariables.Mean.c(1);oo_.SmoothedVariables.Mean.rnom(1);
    oo_.SmoothedVariables.Mean.pic(1);oo_.SmoothedVariables.Mean.lab(1);
    oo_.SmoothedVariables.Mean.rw(1);oo_.SmoothedVariables.Mean.y(1);
    oo_.SmoothedVariables.Mean.mc(1);oo_.SmoothedVariables.Mean.a(1);
    oo_.SmoothedVariables.Mean.g(1);oo_.SmoothedVariables.Mean.z(1);
    oo_.SmoothedVariables.Mean.rnom_obs(1);oo_.SmoothedVariables.Mean.pic_obs(1);
oo_.SmoothedVariables.Mean.y_obs(1)];

% Shocks desde el segundo periodo

ex_todos=[oo_.SmoothedShocks.Mean.e_a(2:T),oo_.SmoothedShocks.Mean.e_g(2:T),oo_.SmoothedShocks.Mean.e_z(2:T)];


% Caso Alternativo
% Regla de politica monetaria distinta
% Se ha corrido el fichero mod con phi_pic=1.1 con anterioridad
%dynare nk_closedv1_cal_trans_phi11.mod 
load('nk_closedv1_cal_trans_phi11_results.mat');

% Simulacion con todos los shocks
dr=oo_.dr;              % Solucion del modelo en DYNARE
iorder=1;               % Orden de simulacion
y_pic11=simult_(y0,dr,ex_todos,iorder);    % Simulacion de un modelo con condicion inicial y0, solucion dr y serie de shocks ex_todos


datos_trans;                    % Carga los datos


time=[1984:0.25:2007.75]';

figure(1)
subplot(3,1,1);plot(time,pic_obs,time,y_pic11(11,:),'LineWidth',2);title('Inflacion');xlim([1984 2008]);legend('Original','\phi\pi_c=1.1');
subplot(3,1,2);plot(time,rnom_obs,time,y_pic11(12,:),'LineWidth',2);title('Tasa Interes');xlim([1984 2008]);
subplot(3,1,3);plot(time,y_obs,time,y_pic11(13,:),'LineWidth',2);title('Producto');xlim([1984 2008]);

% Variables no observables de interes

% Valores estimados

% sigma   = 0.4912;
% sigma_L = 1.122;
% rho_a   = 0.9943;
% rho_g   = 0.9434;
% 
% load('nk_closedv1_est_trans_results.mat');

% Producto Potencial
% Primer Periodo

% for tt=1:T
% y_pot(tt)=(1+sigma_L)/(1/sigma+sigma_L)*oo_.SmoothedVariables.Mean.a(tt);
% r_nat(tt)=-(1-rho_a)*(1+sigma_L)/(1+sigma*sigma_L)*oo_.SmoothedVariables.Mean.a(tt)+(1-rho_g)*oo_.SmoothedVariables.Mean.g(tt);
% end
% 
% 
% figure(2)
% subplot(2,1,1);plot(time,y_pot,'LineWidth',2);title('Producto Potencial');xlim([1984 2008]);
% subplot(2,1,2);plot(time,r_nat,'LineWidth',2);title('Tasa Interes Natural');xlim([1984 2008]);
% 
