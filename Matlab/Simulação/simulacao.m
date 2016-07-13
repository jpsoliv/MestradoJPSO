clear all
close all
clc

Ts = 1e-7;
f = 400;

sim('power_aircraft_distribution_mexido_2014_V2');

% tout(1)=[];tout(end)=[];

figure(1)
subplot(3,1,1);
plot(tout,Vint);
axis([0 max(tout) -200 200]);
title('V Interno');
grid on
subplot(3,1,2)
plot(tout,Vterminal);
axis([0 max(tout) -200 200]);
title('Vterminal');
grid on
subplot(3,1,3)
plot(tout,Vint-Vterminal);
% axis([0 max(tout) -200 200]);
title('Vint-Vterminal');
grid on

figure(2);
subplot(2,1,1);
plot(tout,Iabc);
title('Iabc');
subplot(2,1,2);
plot(tout,Vabc);
axis([0 max(tout) -200 200]);
title('Vabc');
