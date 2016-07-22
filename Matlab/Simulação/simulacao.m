clear all
close all
clc

Ts = 2e-5;
Tf = 3;
f = 400;

%% Definição sistema EHA

degrau = 0.2;                % amplitude do sinal [m]

%% Parâmetros do modelo EHA
beta = 1.523741e+9;         % Módulo Compressibilidade do fluido [Pa]
Dp = 13000e-6/(2*pi);         % Deslocamento da bomba [m^3/rad]
A = pi*0.1^2;               % Área do cilindro do EHA [m^2]
B = 3.8;                    % Coeficente de viscosidade [N*s/m]
M = 40;                    % Peso [Kg]
V0 = A*0.4;                 % Volume médio dos tubos e cilindor [m^3]
Ct = 1e-6;                  % Coeficiente de vazamento equivalente [m^3/(s*Pa)]
k = 2000;                     % Constante elástica da mola [N/m]

N0 = A*Dp*beta/(M*V0);
D3 = 1;
D2 = B/M+Ct*beta/V0;
D1 = k/M+A^2*beta/(V0*M)+beta*Ct*B/(V0*M);
D0 = beta*Ct*k/(V0*M);

% sim('power_aircraft_distribution_mexido_2014_V2');
sim('power_aircraft_distribution_mexido_2014_V3');
% tout(1)=[];tout(end)=[];

%%
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