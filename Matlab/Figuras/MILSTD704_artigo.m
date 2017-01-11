function MILSTD704(time,signal,f_rede)

%% FFT
% ini = find(time<=ti);
% fim = find(time>=tf);
% 
% index_ini = ini(end);
% index_fim = fim(1);
% 
% t = time(index_ini:index_fim);
% X = signal(index_ini:index_fim)';

[fs,ys] = fft_mestre(signal,time);

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

%% THD

index = zeros(1,40);
for i=1:40
k = max(ys(fs>=i*f_rede-20&fs<=i*f_rede+20));
index(i)= find(ys==k);
end

fund = ys(index(1));

y1 = ys(index);
y1(1) = [];
THD = 100*sqrt(dot(y1,y1))/fund;

IHC = 100*max(y1)/fund;
IHCf = fs(index);
IHCf = IHCf(max(y1)==ys(index));

%% plots

% close all
ft = 30;
fatorX = 2;
fatorY = 0.9;
ftaxes = 50;
ftlegend = 12;

loglog(ffix,yfix,'k',fvar,yvar,'k--');
hold on
plot(fs,ys/sqrt(2));
hold off
ylim([10^(-34.44/20) 200]);
xlim([10 1e6]);

% l = legend('MIL-STD 704F - 400 Hz','MIL-STD 704F - Freq. Var.');
% set(l,'Interpreter','latex');
% set(l,'FontName','Times New Roman');
% set(l,'FontSize',ftlegend);
% set(l,'Box','off');

xtx = get(gca,'xlim');
xtx(1) = [];
ytx = get(gca,'ylim');
ytx(1) = [];
tx = text(xtx*0.5,ytx*0.5,{['THD = ' num2str(THD,'%.2f') '%'];['IHC = ' num2str(IHC,'%.2f') '% @ ' num2str(round(IHCf),'%u') ' Hz']});
set(tx,'VerticalAlignment','top');
set(tx,'HorizontalAlignment','right');
set(tx,'Interpreter','latex');
set(tx,'FontName','Times New Roman');
set(tx,'FontSize',ftlegend);

% xl = xlabel('Frequência [Hz]');
% set(xl,'Interpreter','tex')
% set(xl,'FontName','Times New Roman');
% % set(xl,'FontAngle','italic');
% set(xl,'FontSize',ftaxes);
% 
% yl = ylabel('Amplitude [\itV_{rms}\rm]');
% set(yl,'Interpreter','tex');
% set(yl,'FontName','Times New Roman');
% % set(yl,'FontAngle','italic');
% set(yl,'FontSize',ftaxes);
