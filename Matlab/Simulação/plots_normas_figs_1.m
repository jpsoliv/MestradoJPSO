
%% Coleta de dados
Vsignal = Vabc.signals.values;
Isignal = Iabc.signals.values;
time = Vabc.time;
ti = 72.85;
tf = 72.945;
f_rede = 400;

%% Defini��o de per�odo
 
ini = find(time<=ti);
fim = find(time>=tf);

index_ini = ini(end);
index_fim = fim(1);

t = time(index_ini:index_fim);
V = Vsignal(index_ini:index_fim,:);
I = Isignal(index_ini:index_fim,:);

%% Plots

figure(1)
% plot(t,X,t,Iabc.signals.values(index_ini:index_fim));
subplot(2,1,1);
plot(t,V);ylabel('Tens�o [V]');title('Tens�o e Corrente no PCC')
subplot(2,1,2)
plot(t,I);xlabel('tempo[s]');ylabel('Corrente [A]');
% 
% figure(2)
% DO160(t,V,f_rede);

figure(3)
MILSTD704(t,V);

figure(4)
[P,Q,S]=aparente(t,V,I);

