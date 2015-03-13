clear all
close all
clc

t = 0:1e-6:0.01;

%%
Vrms = 115;
Va = Vrms*sqrt(2)*sin(2*pi*400*t);
Vb = Vrms*sqrt(2)*sin(2*pi*400*t-2*pi/3);
Vc = Vrms*sqrt(2)*sin(2*pi*400*t-4*pi/3);

cl = sqrt(2/3)*[1/sqrt(2) 1/sqrt(2) 1/sqrt(2); 1 -1/2 -1/2;0 sqrt(3)/2 -sqrt(3)/2]*[Va;Vb;Vc];

V0 = cl(1,:);
Valpha = cl(2,:);
Vbeta = cl(3,:);

figure;
plot(t,Va,t,Vb,t,Vc);
legend('Va','Vb','Vc');

figure;
plot(t,V0,t,Valpha,t,Vbeta);
legend('V0','V\alpha','V\beta');

%%
Z = 1/(2*pi*400*1e-6);
Irms = Vrms/Z;
Ia = Irms*sqrt(2)*sin(2*pi*400*t+pi/2);
Ib = Irms*sqrt(2)*sin(2*pi*400*t-2*pi/3+pi/2);
Ic = Irms*sqrt(2)*sin(2*pi*400*t-4*pi/3+pi/2);

cl = sqrt(2/3)*[1/sqrt(2) 1/sqrt(2) 1/sqrt(2); 1 -1/2 -1/2;0 sqrt(3)/2 -sqrt(3)/2]*[Ia;Ib;Ic];

I0 = cl(1,:);
Ialpha = cl(2,:);
Ibeta = cl(3,:);

figure;
plot(t,Ia,t,Ib,t,Ic);
legend('Ia','Ib','Ic');

figure;
plot(t,I0,t,Ialpha,t,Ibeta);
legend('I0','I\alpha','I\beta');

%%

P0 = V0.*I0;
P = Valpha.*Ialpha + Vbeta.*Ibeta;
Q = Vbeta.*Ialpha - Valpha.*Ibeta;

figure;
plot(t,P0,t,P,t,Q);
legend('P0','P','Q');
