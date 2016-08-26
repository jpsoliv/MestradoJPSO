clear all 
close all 
clc

f = 1;
T = 3;
vp = 115*sqrt(2);
ip = 5;
t = linspace(0,T/f*2,50000);
Ts = t(end)/length(t);

va = vp*sin(2*pi*f*t);
vb = vp*sin(2*pi*f*t-2*pi/3);
vc = vp*sin(2*pi*f*t+2*pi/3);

figure(1)
plot(t,va,t,vb,t,vc)

ia = zeros(1,length(t));
ib = zeros(1,length(t));
ic = zeros(1,length(t));

ia(find(va>=vb&va>vc))=ip;
ia(find(va<vb&va<=vc))=-ip;
ib(find(vb>=va&vb>vc))=ip;
ib(find(vb<va&vb<=vc))=-ip;
ic(find(vc>=va&vc>vb))=ip;
ic(find(vc<va&vc<=vb))=-ip;

% ia(1:length(ia)/2)=0;
% ib(1:length(ib)/2)=0;
% ic(1:length(ic)/2)=0;

figure(2)
plot(t,ia,t,ib,t,ic)

%% Clarke Transformation

V0 = sqrt(2/3)*((1/sqrt(2)*va + 1/sqrt(2)*vb + 1/sqrt(2)*vc));
Valpha = sqrt(2/3)*(1*va - 1/2*vb - 1/2*vc);
Vbeta = sqrt(2/3)*(0*va + sqrt(3)/2*vb - sqrt(3)/2*vc);

I0 = sqrt(2/3)*(1/sqrt(2)*ia + 1/sqrt(2)*ib + 1/sqrt(2)*ic);
Ialpha = sqrt(2/3)*(1*ia - 1/2*ib - 1/2*ic);
Ibeta = sqrt(2/3)*(0*ia + sqrt(3)/2*ib - sqrt(3)/2*ic);

figure;
plot(t,V0,t,Valpha,t,Vbeta); title('V_0, V_{\alpha}, V_{\beta}');legend('V_0','V_{\alpha}','V_{\beta}');
figure;
plot(t,I0,t,Ialpha,t,Ibeta);title('I_0, I_{\alpha}, I_{\beta}');legend('I_0','I_{\alpha}','I_{\beta}');

%% P-Q theory

P0 = V0.*I0;
P = Valpha.*Ialpha + Vbeta.*Ibeta;
Q = Vbeta.*Ialpha - Valpha.*Ibeta;

figure;
plot(t,P0,t,P,t,Q);title('P_0, P, Q');legend('P_0','P','Q');

% P = Valpha.*Ialpha+Vbeta.*Ibeta+V0.*I0;
% qalpha = Vbeta.*I0-V0.*Ibeta;
% qbeta = V0.*Ialpha-Valpha.*I0;
% q0 = -Valpha.*Ibeta-Vbeta.*Ialpha;

%% Filtering

f = 2;
% fsample = 1/2e-7;
fsample = 1/Ts;

[b,a] = butter(4,f/(fsample/2),'low');

Pbar = filter(b,a,P);

%% Power Selection
% P = Pbar+Ptil
% Pbar = Potencia ativa;

Ptil = P-Pbar;

Ptil(1,1:length(Ptil)/3) = 0;
Ptil(1,length(Ptil)*2/3:end) = 0;
Q(1,1:length(Q)/3) = 0;
Q(1,length(Q)*2/3:end) = 0;

figure;
plot(t,Pbar,t,Ptil,t,P);legend('Pbar','Ptil','P');

% Ptil1 = Ptil;
% Ptil1(1:length(Ptil1)/2)=0; 
% Q1=Q;
% Q1(1,1:length(Q)/2)=0;
%%  Current Correction

I0_p = -P0./V0;
Ialpha_p = 1./(Valpha.^2+Vbeta.^2).*(-Valpha.*Ptil - Vbeta.*Q);
Ibeta_p = 1./(Valpha.^2+Vbeta.^2).*(-Vbeta.*Ptil + Valpha.*Q);

% Ialpha_p1 = 1./(Valpha.^2+Vbeta.^2).*(-Valpha.*Ptil1 - Vbeta.*Q1);
% Ibeta_p1 = 1./(Valpha.^2+Vbeta.^2).*(-Vbeta.*Ptil1 + Valpha.*Q1);

% Vab0quad = Valpha.^2+Vbeta.^2+V0.^2;

% Ialpha_p = 1./Vab0quad.*(Valpha.*-Ptil+V0.*-qbeta-Vbeta.*-q0);
% Ibeta_p = 1./Vab0quad.*(Vbeta.*-Ptil-V0.*-qalpha+Valpha.*-q0);
% I0_p = 1./Vab0quad.*(V0.*-Ptil+Vbeta.*-qalpha-Valpha.*-qbeta);
% figure;
% plot(t,Ialpha_p,t,Ibeta_p);


%% Inverse Clarke Transformation

Ia_p = sqrt(2/3)*(1/sqrt(2)*I0_p + Ialpha_p);
Ib_p = sqrt(2/3)*(1/sqrt(2)*I0_p - 1/2*Ialpha_p + sqrt(3)/2*Ibeta_p);
Ic_p = sqrt(2/3)*(1/sqrt(2)*I0_p - 1/2.*Ialpha_p - sqrt(3)/2.*Ibeta_p);

figure;
subplot(3,1,1);
plot(t,Ia_p);legend('Ia_p');
subplot(3,1,2);
plot(t,ia);legend('ia');
subplot(3,1,3);
plot(t,ia+Ia_p);legend('ia+Ia_p');

%% Active Filtering

Ia = ia+Ia_p;
Ib = ib+Ib_p;
Ic = ic+Ic_p;

figure
plot(t,Ia,t,Ib,t,Ic);
%% plots
figure
subplot(3,1,1);
plot(t,Ia,t,va);
subplot(3,1,2);
plot(t,Ib,t,vb);
subplot(3,1,3);
plot(t,Ic,t,vc);

figure
subplot(2,1,1);
plot(t,va,t,vb,t,vc,t,ia,t,ib,t,ic);
subplot(2,1,2);
plot(t,va,t,vb,t,vc,t,ia,t,ib,t,ic);

