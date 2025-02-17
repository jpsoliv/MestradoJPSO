clear all
close all
clc

t = linspace(0,1,1000);     %tempo
f = 2.25;                   %frequencia Hz
w = 2*pi*f;                 %frequencia rad/s

Vphi_a = 0;     
Vphi_b = 2*pi/3;
Vphi_c = -2*pi/3;


Va = 115;
Vb = 115;
Vc = 115;

Za = 1+6j;
Zb = 1+3j;
Zc = 1+2j;

va = Va*cos(w*t-Vphi_a);
vb = Vb*cos(w*t-Vphi_b);
vc = Vc*cos(w*t-Vphi_c);

ia = Va/abs(Za)*cos(w*t-Vphi_a-angle(Za));
ib = Vb/abs(Zb)*cos(w*t-Vphi_b-angle(Zb));
ic = Vc/abs(Zc)*cos(w*t-Vphi_c-angle(Zc));

v = [va;vb;vc];
i = [ia;ib;ic];

p = dot(v,i);           % Potencia ativa instantanea
q = cross(v,i);         % Potencia reativa instantanea

ip = [p./dot(v,v).*v(1,:); p./dot(v,v).*v(2,:); p./dot(v,v).*v(3,:)];
iq = cross(q,v);
iq = [iq(1,:)./dot(v,v); iq(2,:)./dot(v,v); iq(3,:)./dot(v,v)];

figure(1)
plot(t,v,t,i);

figure(2)
plot(t,p,t,q);

figure(3)
subplot(3,1,1)
plot(t,ip)
subplot(3,1,2)
plot(t,iq)
subplot(3,1,3)
plot(t,ip+iq,t,i)

pa = Va*Va/(abs(Za)*2)*cos(angle(Za));
pb = Vb*Vb/(abs(Zb)*2)*cos(angle(Zb));
pc = Vc*Vc/(abs(Zc)*2)*cos(angle(Zc));
pa+pb+pc