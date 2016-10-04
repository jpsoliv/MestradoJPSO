function DO160(time,signal,f_rede)
%% Definição dos Sinais

% time = Vabc_S.time;
% signal = Vabc_S.signals.values(:,1);
% f_rede = 400;

%% FFT

% ti = 73;
% tf = 73.05;

% ini = find(time<=ti);
% fim = find(time>=tf);
% 
% index_ini = ini(end);
% index_fim = fim(1);
% 
% t = time(index_ini:index_fim);
% X = signal(index_ini:index_fim)';

% [f,y] = fft_mestre(X,t);

[f,y] = fft_mestre(signal,time);

plot(f,y)

%% THD

index = zeros(1,40);
for i=1:40
k = max(y(f>=i*f_rede-20&f<=i*f_rede+20));
index(i)= find(y==k);
end

fund = y(index(1));

y1 = y(index);
y1(1) = [];
THD = 100*sqrt(dot(y1,y1))/fund;

%% PLOT

% figure(1)
% plot(t,X);

figure(2);
bar(round(f(index)/f_rede),y(index)/sqrt(2));
hold on
plot(f/f_rede,y/sqrt(2));
hold off
xlim([0 40]);
xlabel('Harmônica')
ylabel('Amplitude')
xtx = get(gca,'xlim');
xtx(1) = [];
ytx = get(gca,'ylim');
ytx(1) = [];
tx = text(xtx*0.9,ytx*0.9,['THD = ' num2str(THD,'%.2f'),'%']);
set(tx,'VerticalAlignment','top');
set(tx,'HorizontalAlignment','right');
hold off

