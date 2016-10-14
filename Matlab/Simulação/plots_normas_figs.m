
%% Coleta de dados
Vsignal = Vabc.signals.values;
Isignal = Iabc.signals.values;
time = Vabc.time;
ti = 73.3;
tf = 73.7;
f_rede = 400;

%% Definição de período
 
ini = find(time<=ti);
fim = find(time>=tf);

index_ini = ini(end);
index_fim = fim(1);

t = time(index_ini:index_fim);
V = Vsignal(index_ini:index_fim,:);
I = Isignal(index_ini:index_fim,:);

%% Plots

figure(1)
title('Tensão e Corrente no PCC')
% plot(t,X,t,Iabc.signals.values(index_ini:index_fim));
[ax, ~, ~] = plotyy(t,V(:,1),t,I(:,1));
axes(ax(1)); ylabel('Tensão [V]');ylim([-190 190]);xlim([73.7 73.71]);
axes(ax(2)); ylabel('Corrente [A]');ylim([-max(I(:,1))*1.5 max(I(:,1))*1.5]);xlim([73.7 73.71]);
xlabel('tempo[s]');

figure(2)
DO160(t,V,f_rede);

figure(3)
MILSTD704(t,V);

figure(4)
[P,Q,S]=aparente(t,V,I);

