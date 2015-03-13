close all 
clear all
clc

%% Data

M = csvread('teste.csv',1,0);

t = M(:,1);
Va = M(:,8);
Vb = M(:,9);
Vc = M(:,10);

Ila = M(:,5);
Ilb = M(:,6);
Ilc = M(:,7);

%% Clarke Transformation

V0 = sqrt(2/3).*(1/sqrt(2).*Va + 1/sqrt(2).*Vb + 1/sqrt(2)*Vc);
Valpha = sqrt(2/3).*(1*Va - 1/2.*Vb - 1/2.*Vc);
Vbeta = sqrt(2/3).*(0*Va + sqrt(3)/2.*Vb - sqrt(3)/2.*Vc);

I0 = sqrt(2/3).*(1/sqrt(2).*Ila + 1/sqrt(2).*Ilb + 1/sqrt(2)*Ilc);
Ialpha = sqrt(2/3).*(1*Ila - 1/2.*Ilb - 1/2.*Ilc);
Ibeta = sqrt(2/3).*(0*Ila + sqrt(3)/2.*Ilb - sqrt(3)/2.*Ilc);

% figure;
% plot(t,V0,t,Valpha,t,Vbeta);
% figure;
% plot(t,I0,t,Ialpha,t,Ibeta);

%% P-Q theory

P = Valpha.*Ialpha + Vbeta.*Ibeta;
Q = Vbeta.*Ialpha - Valpha.*Ibeta;

% figure;
% plot(t,P,t,Q);

%% Filtering

f = 200;
fsample = 1/2e-7;

[b,a] = butter(3,f/(fsample/2),'low');

Pbar = filter(b,a,P);

%% Power Selection
% P = Pbar+Ptil
% Pbar = Potencia ativa;

Ptil = P-Pbar;

%%  Current Corretion

Ialpha_p = 1./(Valpha.^2+Vbeta.^2).*(-Valpha.*Ptil - Vbeta.*Q);
Ibeta_p = 1./(Valpha.^2+Vbeta.^2).*(-Vbeta.*Ptil + Valpha.*Q);

% figure;
% plot(t,Ialpha_p,t,Ibeta_p);


%% inverse Clarke Transformation

Ia_p = sqrt(2/3)*Ialpha_p;
Ib_p = sqrt(2/3)*(-1/2.*Ialpha_p + sqrt(3)/2.*Ibeta_p);
Ic_p = sqrt(2/3)*(-1/2.*Ialpha_p - sqrt(3)/2.*Ibeta_p);

% figure;
% plot(t,Ia_p)

%% Active Filtering

Ia = Ila+Ia_p;
Ib = Ilb+Ib_p;
Ic = Ilc+Ic_p;

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

