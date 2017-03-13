function FP = FP(time,V,I,f_rede)
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

[fv,yv,angv] = fft_FP(V,time);
[fi,yi,angi] = fft_FP(I,time);

% plot(f,y)

%% THD_v

index_v = zeros(1,40);
for i=1:40
k = max(yv(fv>=i*f_rede-20&fv<=i*f_rede+20));
index_v(i)= find(yv==k);
end

fund_v = yv(index_v(1));
yv = yv(index_v);
yv_rms = yv/sqrt(2);

angv = angv(ceil(length(angv)/2):end);
angv = angv(index_v);
%% THD_i

index_i = zeros(1,40);
for i=1:40
k = max(yi(fi>=i*f_rede-20&fi<=i*f_rede+20));
index_i(i)= find(yi==k);
end

fund_i = yi(index_i(1));
yi = yi(index_i);
yi_rms = yi/sqrt(2);

angi = angi(ceil(length(angi)/2):end);
angi = angi(index_i);

%% Fator de Potência

FP_num = 0;
for n=1:40
    FP_num = yv_rms(n)*yi_rms(n)*cos(angv(n)-angi(n)) + FP_num;
end

FP_den = sqrt(dot(yv_rms,yv_rms))*sqrt(dot(yi_rms,yi_rms));

FP = FP_num/FP_den;

%% Plot

% ft = 30;
% fatorX = 2;
% fatorY = 0.9;
% ftaxes = 24;
% ftlegend = 12;
% % figure(1)
% % plot(t,X);
% 
% figure(1);
% bar(round(fv(index_v)/f_rede),yv/sqrt(2));
% figure(2);
% bar(round(fi(index_i)/f_rede),yi/sqrt(2));
% plot(f/f_rede,y/sqrt(2));
% hold off
% xlim([2 40]);
% ylim([0 y_max]);
% set(gca,'Xtick',[0:5:40]);

% xl = xlabel('Harmônica');
% set(xl,'Interpreter','tex');
% set(xl,'FontName','Times New Roman');
% set(xl,'FontSize',ftaxes);
% 
% yl = ylabel('Amplitude [\itV_{rms}\rm]');
% set(yl,'Interpreter','tex');
% set(yl,'FontName','Times New Roman');
% % set(yl,'FontSize',ftaxes);
% 
% xtx = get(gca,'xlim');
% xtx(1) = [];
% ytx = get(gca,'ylim');
% ytx(1) = [];
% tx = text(xtx*0.9,ytx*0.9,['THD = ' num2str(THD,'%.2f') '%']);          % Retira o IHC da figura
% % tx = text(xtx*0.9,ytx*0.9,{['THD = ' num2str(THD,'%.2f') '%'];['IHC = ' num2str(IHC,'%.2f') '% em ' num2str(round(IHCf),'%u') ' Hz']});
% set(tx,'VerticalAlignment','top');
% set(tx,'HorizontalAlignment','right');
% set(tx,'Interpreter','latex');
% set(tx,'FontName','Times New Roman');
% set(tx,'FontSize',ftlegend);
% hold off

function [f,y_abs,y_ang]=fft_FP(X,t)
T = ((t(end)-t(1))/(length(t)-1));      % Sampling period
fs = 1/T;                               % Sampling frequency
m = length(X);                          % Window length
% n = pow2(nextpow2(m));                % Transform length
Y = fft(X);
y2 = abs(Y)/m;                          % DFT of signal
y_abs = y2(1:floor(m/2)+1);
y_abs(2:end-1) = 2*y_abs(2:end-1);
y_ang = fftshift(angle(Y));
f = fs*(0:(m/2))/m;                     % Frequency range
