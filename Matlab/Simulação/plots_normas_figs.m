
signal = Vabc_S.signals.values;
time = Vabc_S.time;
ti = 72.95;
tf = 73.2;
f_rede = 400;

ini = find(time<=ti);
fim = find(time>=tf);

index_ini = ini(end);
index_fim = fim(1);

t = time(index_ini:index_fim);
X = signal(index_ini:index_fim)';

figure(1)
plot(t,X,t,Iabc_S.signals.values(index_ini:index_fim));

figure(2)
DO160(time,signal,ti,tf,f_rede)

figure(3)
MILSTD704(time,signal,ti,tf,f_rede);

