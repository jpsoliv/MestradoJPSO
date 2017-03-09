clear all


%% Curvas Norma 400 Hz

f400 = [10 100 1000 3000 6000 500000];
y400 = [10^(-10/20) 10^(-10/20) 10^(10/20) 10^(10/20) 10^(3.9794/20) 10^(-34.44/20)];

%% Curvas Norma Variável

fvar = [10 100 1000 3000 6000 500000 1000000];
yvar = [10^(-10/20) 10^(-10/20) 10^(10/20) 10^(10/20) 10^(10/20) 10^(-28.4164/20) 10^(-34.4370/20)];

%% Curvas Norma 60 Hz

f60 = [1 15 150 450 75000];
y60 = [10^(-10/20) 10^(-10/20) 10^(10/20) 10^(10/20) 10^(-34.44/20)];

%% Curvas Norma 28 V

f28 = [10 1000 5000 50000 500000];
y28 = [10^(-20/20) 10^(0/20) 10^(0/20) 10^(-20/20) 10^(-60/20)];

%% Curvas Norma 270 V

f270 = [10 1000 5000 50000 500000];
y270 = [10^(-10/20) 10^(10/20) 10^(10/20) 10^(-10/20) 10^(-50/20)];

%% plots

% close all
ft = 30;
factor = 400;
ftaxes = 18;
ftlegend = 13;
xtickfontsize = 13;

figure(1)
loglog(f400,y400,'k',fvar,yvar,'k--',f60,y60,'k-.');
ylim([10^(-34.44/20) 10^(20/20)]);
xlim([1 1e6]);
grid on

l1 = legend('400 Hz','Freq. Var.','60 Hz');
set(l1,'Interpreter','latex');
set(l1,'FontName','Times New Roman');
set(l1,'FontSize',ftlegend);
set(l1,'Box','off');

axesftsize(ftaxes,'Frequ\^encia [Hz]','Amplitude [$V_{rms}$]',2);
set(gca,'FontSize',xtickfontsize);
set(gca,'Position',[0.11,0.14,0.87,0.823]);
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1),pos(2),874/524*factor,factor]);

figure(2)
loglog(f28,y28,'k',f270,y270,'k--');
ylim([10^(-60/20) 10^(20/20)]);
xlim([10 1e6]);
grid on

l1 = legend('28 V','270 V');
set(l1,'Interpreter','latex');
set(l1,'FontName','Times New Roman');
set(l1,'FontSize',ftlegend);
set(l1,'Box','off');

axesftsize(ftaxes,'Frequ\^encia [Hz]','Amplitude [$V_{rms}$]',2);
set(gca,'FontSize',xtickfontsize);
set(gca,'Position',[0.11,0.14,0.87,0.823]);
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1),pos(2),874/524*factor,factor]);

% figure(2)
% loglog(f60,y60,'k');
% % hold on
% % plot(fs,ys/sqrt(2));
% % hold off
% ylim([10^(-34.44/20) 10^(20/20)]);
% xlim([1 1e5]);
% 
% l2 = legend('MIL-STD 704F - 60 Hz');
% set(l2,'Interpreter','latex');
% set(l2,'FontName','Times New Roman');
% set(l2,'FontSize',ftlegend);
% set(l2,'Box','off');


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