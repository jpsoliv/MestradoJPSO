clear all
close all
clc

%% Dados Simula��o
Ts = 5e-7;
Tf = 1;

%% Dados Gerador
f = 400;

%% Defini��o sistema EHA

degrau = 0.2;                   % amplitude do sinal [m]

%% Par�metros do modelo EHA
beta = 1.523741e+9;             % M�dulo Compressibilidade do fluido [Pa]
Dp = 13000e-6/(2*pi);           % Deslocamento da bomba [m^3/rad]
A = pi*0.1^2;                   % �rea do cilindro do EHA [m^2]
B = 3.8;                        % Coeficente de viscosidade [N*s/m]
M = 40;                         % Peso [Kg]
V0 = A*0.4;                     % Volume m�dio dos tubos e cilindor [m^3]
Ct = 1e-6;                      % Coeficiente de vazamento equivalente [m^3/(s*Pa)]
k = 2000;                       % Constante el�stica da mola [N/m]

N0 = A*Dp*beta/(M*V0);
D3 = 1;
D2 = B/M+Ct*beta/V0;
D1 = k/M+A^2*beta/(V0*M)+beta*Ct*B/(V0*M);
D0 = beta*Ct*k/(V0*M);

%% Simula��o

% sim('power_aircraft_distribution_mexido_2014_V2');
sim('power_aircraft_distribution_mexido_2014_V3');

%% Plot

plots
