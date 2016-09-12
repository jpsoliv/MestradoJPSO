clear all
close all
clc 

%% Definição sistema EHA
Ts = 1e-6;

degrau = 0.01;                % amplitude do sinal [m]

%% Parâmetros do modelo EHA
beta = 1.523741e+9;         % Módulo Compressibilidade do fluido [Pa]
Dp = 13000e-6/(2*pi);         % Deslocamento da bomba [m^3/rad]
A = pi*0.1^2;               % Área do cilindro do EHA [m^2]
B = 3.8;                    % Coeficente de viscosidade [N*s/m]
M = 40;                    % Peso [Kg]
V0 = A*0.4;                 % Volume médio dos tubos e cilindor [m^3]
Ct = 1e-6;                  % Coeficiente de vazamento equivalente [m^3/(s*Pa)]
k = 2000*10;                     % Constante elástica da mola [N/m]

N0 = A*Dp*beta/(M*V0);
D3 = 1;
D2 = B/M+Ct*beta/V0;
D1 = k/M+A^2*beta/(V0*M)+beta*Ct*B/(V0*M);
D0 = beta*Ct*k/(V0*M);

[Ass,Bss,Css,Dss] = tf2ss([N0],[D3,D2,D1,D0]);

sim('modelo_EHA');

figure(1);
subplot(2,1,1);
plot(Vabc.time,Vabc.signals.values);
subplot(2,1,2);
plot(Iabc.time,Iabc.signals.values);