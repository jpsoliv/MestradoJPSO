function MILSTD704(time,signal,ti,tf,f_rede)

%% FFT
ini = find(time<=ti);
fim = find(time>=tf);

index_ini = ini(end);
index_fim = fim(1);

t = time(index_ini:index_fim);
X = signal(index_ini:index_fim)';

[fs,ys] = fft_mestre(X,t);

%% Curvas Norma

ffix = 10:10:500000;

yfix = zeros(1,length(ffix));

yfix(1:find(ffix==100))=0.316;

yfix(ffix>100&ffix<1000) = [];
ffix(ffix>100&ffix<1000) = [];
yfix(ffix==1000)=3.16;

yfix(find(ffix==1000):find(ffix==3000)) = 3.16;

yfix(ffix>3000&ffix<500000) = [];
ffix(ffix>3000&ffix<500000) = [];

yfix(ffix==500000) = 10^(-34.44/20);

fvar = 10:10:1e6;

yvar = zeros(1,length(fvar));

yvar(1:find(fvar==100))=0.316;

yvar(fvar>100&fvar<1000) = [];
fvar(fvar>100&fvar<1000) = [];
yvar(fvar==1000)=3.16;

yvar(find(fvar==1000):find(fvar==6000)) = 3.16;

yvar(fvar>6000&fvar<1e6) = [];
fvar(fvar>6000&fvar<1e6) = [];

yvar(fvar==1e6) = 10^(-34.44/20);

%% plots
loglog(ffix,yfix,'k',fvar,yvar,'k--');legend('MIL-STD 704F - 400 Hz', 'MIL-STD 704F - Freq. Variável');
hold on
plot(fs,ys/sqrt(2));
hold off

xlim([10 1e6])
end