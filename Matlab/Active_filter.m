close all 
% clear all
% clc

%% Data
% 
% M = csvread('teste.csv',1,0);
% 
% t = M(:,1);
% Va = M(:,8);
% Vb = M(:,9);
% Vc = M(:,10);
% 
% Ila = M(:,5);
% Ilb = M(:,6);
% Ilc = M(:,7);

t = Vabc.time;

% Va = EHA_Vabc.signals.values(:,1);
% Vb = EHA_Vabc.signals.values(:,2);
% Vc = EHA_Vabc.signals.values(:,3);
% 
% Ila = EHA_Iabc.signals.values(:,1);
% Ilb = EHA_Iabc.signals.values(:,2);
% Ilc = EHA_Iabc.signals.values(:,3);

Va = Vabc.signals.values(:,1);
Vb = Vabc.signals.values(:,2);
Vc = Vabc.signals.values(:,3);

Ila = Iabc.signals.values(:,1);
Ilb = Iabc.signals.values(:,2);
Ilc = Iabc.signals.values(:,3);

%% Clarke Transformation

V0 = sqrt(2/3)*((1/sqrt(2)*Va + 1/sqrt(2)*Vb + 1/sqrt(2)*Vc));
Valpha = sqrt(2/3)*(1*Va - 1/2*Vb - 1/2*Vc);
Vbeta = sqrt(2/3)*(0*Va + sqrt(3)/2*Vb - sqrt(3)/2*Vc);

I0 = sqrt(2/3)*(1/sqrt(2)*Ila + 1/sqrt(2)*Ilb + 1/sqrt(2)*Ilc);
Ialpha = sqrt(2/3)*(1*Ila - 1/2*Ilb - 1/2*Ilc);
Ibeta = sqrt(2/3)*(0*Ila + sqrt(3)/2*Ilb - sqrt(3)/2*Ilc);

figure;
plot(t,V0,t,Valpha,t,Vbeta); title('V_0, V_{\alpha}, V_{\beta}');legend('V_0','V_{\alpha}','V_{\beta}');
figure;
plot(t,I0,t,Ialpha,t,Ibeta);title('I_0, I_{\alpha}, I_{\beta}');legend('I_0','I_{\alpha}','I_{\beta}');

%% P-Q theory

% P0 = V0.*I0;
P = Valpha.*Ialpha + Vbeta.*Ibeta;
Q = Vbeta.*Ialpha - Valpha.*Ibeta;
% 
% figure;
% plot(t,P0,t,P,t,Q);title('P_0, P, Q');legend('P_0','P','Q');

% P = Valpha.*Ialpha+Vbeta.*Ibeta+V0.*I0;
% qalpha = Vbeta.*I0-V0.*Ibeta;
% qbeta = V0.*Ialpha-Valpha.*I0;
% q0 = -Valpha.*Ibeta-Vbeta.*Ialpha;

%% Filtering

f = 100;
% fsample = 1/2e-7;
fsample = 1/Ts;

[b,a] = butter(2,f/(fsample/2),'low');

Pbar = filter(b,a,P);

%% Power Selection
% P = Pbar+Ptil
% Pbar = Potencia ativa;

Ptil = P-Pbar;

figure;
plot(t,Ptil,t,P,t,Pbar);legend('Ptil','P','Pbar');

%%  Current Correction

% I0_p = -P0./V0;
% Ialpha_p = 1./(Valpha.^2+Vbeta.^2).*(-Valpha.*Ptil - Vbeta.*Q);
% Ibeta_p = 1./(Valpha.^2+Vbeta.^2).*(-Vbeta.*Ptil + Valpha.*Q);
Vab0quad = Valpha.^2+Vbeta.^2+V0.^2;

% Ialpha_p = (1./Vab0quad.*(Valpha.*Ptil+V0.*qbeta+Vbeta.*q0));
% Ibeta_p = (1./Vab0quad.*(-Vbeta.*Ptil-V0.*qalpha+Valpha.*q0));
% I0_p = -1./Vab0quad.*(V0.*Ptil+Vbeta.*qalpha-Valpha.*qbeta);
Ialpha_p = 1./(Valpha.^2+Vbeta.^2).*(-Valpha.*Ptil - Vbeta.*Q);
Ibeta_p = 1./(Valpha.^2+Vbeta.^2).*(-Vbeta.*Ptil + Valpha.*Q);
% figure;
% plot(t,Ialpha_p,t,Ibeta_p);


%% Inverse Clarke Transformation

% Ia_p = sqrt(2/3)*(1/sqrt(2)*I0_p + Ialpha_p);
% Ib_p = sqrt(2/3)*(1/sqrt(2)*I0_p - 1/2*Ialpha_p + sqrt(3)/2*Ibeta_p);
% Ic_p = sqrt(2/3)*(1/sqrt(2)*I0_p - 1/2.*Ialpha_p - sqrt(3)/2.*Ibeta_p);

Ia_p = sqrt(2/3)*(Ialpha_p);
Ib_p = sqrt(2/3)*(- 1/2*Ialpha_p + sqrt(3)/2*Ibeta_p);
Ic_p = sqrt(2/3)*(- 1/2.*Ialpha_p - sqrt(3)/2.*Ibeta_p);

figure;
plot(t,Ia_p,t,Ila,t,Ila+Ia_p);legend('Ia_p','Ila','Ia_p+Ila');

%% Active Filtering

Ia = Ila+Ia_p;
Ib = Ilb+Ib_p;
Ic = Ilc+Ic_p;

figure
plot(t,Ia,t,Ib,t,Ic);
%% plots
figure
subplot(3,1,1);
plot(t,Ia,t,Va);
subplot(3,1,2);
plot(t,Ib,t,Vb);
subplot(3,1,3);
plot(t,Ic,t,Vc);

figure
subplot(2,1,1);
plot(t,Va,t,Vb,t,Vc,t,Ila,t,Ilb,t,Ilc);
subplot(2,1,2);
plot(t,Va,t,Vb,t,Vc,t,Ia,t,Ib,t,Ic);

