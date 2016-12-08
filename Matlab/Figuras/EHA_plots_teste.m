close all
clc


% load('carga_EHA.mat');
% 
% Ts = 1e-6;
% run('C:\Users\jpsoliv\Documents\João\New folder\Matlab\Active_filter.m')
% close all
% 
% figure(1)
% plot(t,sqrt(P.^2+Q.^2),il8000(:,1),il8000(:,2).*vl8000(:,2)*3,'LineWidth',2.5);
% legend('s','s Dados Spec');

load('corrente_controlada_EHA.mat');

ft = 30;
fatorX = 2;
fatorY = 0.9;
ftaxes = 24;

figure(2)
plot(corrente_controlada.xData,corrente_controlada.yData,'k','LineWidth',2.5);

set(gca,'Position',[0.07,0.20,0.9,0.75]);
set(gca,'FontSize',15);
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1) pos(2) fatorX*pos(3) pos(4)*fatorY]);


xl = xlabel('tempo [s]');
set(xl,'Interpreter','Latex');
set(xl,'FontName','Times New Roman');
% set(xl,'FontAngle','italic');
set(xl,'FontSize',ftaxes);

yl = ylabel('Corrente [A]');
set(yl,'Interpreter','Latex');
set(yl,'FontName','Times New Roman');
% set(yl,'FontAngle','italic');
set(yl,'FontSize',ftaxes);

lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);
xlim([72.85 73.9]);
grid on
