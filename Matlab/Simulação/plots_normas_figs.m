
signal = Vabc.signals.values;
time = Vabc.time;
ti = 73.12;
tf = 73.20;
f_rede = 350;

ini = find(time<=ti);
fim = find(time>=tf);

index_ini = ini(end);
index_fim = fim(1);

t = time(index_ini:index_fim);
X = signal(index_ini:index_fim)';

figure(1)
plot(t,X,t,Iabc.signals.values(index_ini:index_fim));

figure(2)
DO160(time,signal,ti,tf,f_rede);

figure(3)
MILSTD704(time,signal,ti,tf,f_rede);

