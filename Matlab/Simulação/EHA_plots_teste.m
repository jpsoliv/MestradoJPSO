close all
clc

load('carga_EHA.mat');

Ts = 1e-6;
run('D:\Joao\Libraries\Onedrive\Documents\Documents\Mestrado ITA\MestradoJPSO\Matlab\Active_filter.m')
close all


plot(t,sqrt(P.^2+Q.^2),t,Pbar,'LineWidth',2.5);legend('s','Pbar');
hold on
plot(il8000(:,1),il8000(:,2).*vl8000(:,2)*3,'k','LineWidth',2.5)
legend('s','Pbar','Dados Spec');
hold off