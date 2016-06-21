t = 0:0.001:1;
f = 2.5;
phi = pi/3;
w = 2*pi*f;
Vrms = 1;
Irms = 1/1.8;

V = sqrt(2)*Vrms*cos(w*t);
I = sqrt(2)*Irms*cos(w*t-phi);

P = V.*I;

Pp = Vrms.*Irms*cos(phi).*(1+cos(2*w*t));
Pq = Vrms.*Irms*sin(phi).*sin(2*w*t);

subplot(2,1,1);
plot(t,V,t,I,t,P)
grid on
subplot(2,1,2);
plot(t,Pp,t,Pq,t,Pp+Pq)
grid on
