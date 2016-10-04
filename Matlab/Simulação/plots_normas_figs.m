
signal = Vabc.signals.values;
time = Vabc.time;
ti = 73.7;
tf = Vabc.time(end);
f_rede = 350;

ini = find(time<=ti);
fim = find(time>=tf);

index_ini = ini(end);
index_fim = fim(1);

t = time(index_ini:index_fim);
X = signal(index_ini:index_fim)';

figure(1)
% plot(t,X,t,Iabc.signals.values(index_ini:index_fim));
subplot(2,1,1);
plot(t,X);ylabel('Tensão [V]');title('Tensão e Corrente no PCC');xlim([ti tf]);
subplot(2,1,2)
plot(t,Iabc.signals.values(index_ini:index_fim));xlabel('tempo[s]');ylabel('Corrente [A]');xlim([ti tf]);

figure(2)
DO160(time,signal,ti,tf,f_rede);

figure(3)
MILSTD704(time,signal,ti,tf,f_rede);

