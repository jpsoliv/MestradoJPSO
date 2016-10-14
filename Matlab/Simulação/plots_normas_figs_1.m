
%% Coleta de dados
Vsignal = Vabc.signals.values;
Isignal = Iabc.signals.values;
time = Vabc.time;
ti = 72.85;
tf = 72.945;
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
yyaxis left
plot(t,V(:,1));
ylabel('Tensão [V]');
ylim([-190 190]);
yyaxis right
plot(t,I(:,1));xlabel('tempo[s]');ylabel('Corrente [A]');
ylim([-max(I(:,1))*2 max(I(:,1))*2]);

figure('Name','THD e IHC')
DO160(t,V,f_rede);

figure('Name','MIL-STD 704F espectro')
MILSTD704(t,V);

figure(4)
[P,Q,S]=aparente(t,V,I);

