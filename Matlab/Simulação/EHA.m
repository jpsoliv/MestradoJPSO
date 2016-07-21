clear all
close all
clc 

%% Definição sistema EHA
Ts = 1e-5;

%% Parâmetros do modelo EHA
beta = 1.523741e+9;         % Módulo Compressibilidade do fluido [Pa]
Dp = 13000e-6/(2*pi);         % Deslocamento da bomba [m^3/rad]
A = pi*0.1^2;               % Área do cilindro do EHA [m^2]
B = 3.8;                    % Coeficente de viscosidade [N*s/m]
M = 40;                    % Peso [Kg]
V0 = A*0.4;                 % Volume médio dos tubos e cilindor [m^3]
Ct = 1e-6;                  % Coeficiente de vazamento equivalente [m^3/(s*Pa)]
k = 1000;                     % Constante elástica da mola [N/m]

N0 = A*Dp*beta/(M*V0);
D3 = 1;
D2 = B/M+Ct*beta/V0;
D1 = k/M+A^2*beta/(V0*M)+beta*Ct*B/(V0*M);
D0 = beta*Ct*k/(V0*M);

sim('modelo_EHA');

figure(1);
subplot(2,1,1);
plot(tout,Vabc);
subplot(2,1,2);
plot(tout,Iabc);


