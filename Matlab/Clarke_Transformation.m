clear all
close all
clc

t = 0:1e-6:0.01;

Vrms = 115/sqrt(2);
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

cl = sqrt(2/3)*[1 -1/2 -1/2;0 sqrt(3)/2 -sqrt(3)/2]*[Va;Vb;Vc];

Valpha = cl(1,:);
Vbeta = cl(2,:);

figure;
plot(t,Valpha,t,Vbeta);
legend('V\alpha','V\beta');