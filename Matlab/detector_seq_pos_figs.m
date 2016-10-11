ti = 0;
tf = 70/400;
Ts = 1e-5;

t = linspace(ti,tf,1/Ts);

f=400;

ya = 115*sqrt(2)*sin(2*pi*f*t)+0.1*115*sqrt(2)*sin(2*pi*f*3*t)+0.08*115*sqrt(2)*sin(2*pi*f*11*t)+0.06*115*sqrt(2)*sin(2*pi*f*t*7)+0.08*115*sqrt(2)*sin(2*pi*f*t*19)+0.05*115*sqrt(2)*sin(2*pi*f*t*26)+0.09*115*sqrt(2)*sin(2*pi*f*t*14);
yb = circshift(ya,[0, round(1/Ts*1/((tf-ti)*f)/3)]);
yc = circshift(yb,[0, round(1/Ts*1/((tf-ti)*f)/3)]);

y.time = t';
y.signals.values = [ya', yb', yc'];
y.singals.dimensions = 3;

% figure(1)
% plot(t,y.signals.values);

[x]=sim('detector_de_sequencia_positiva','StopTime',num2str(tf));
Vlinha = get(x,'Vlinha');

%% Plots 1
close all
ft = 30;
fatorX = 2;
fatorY = 0.9;
ftaxes = 24;

figure(1);
plot(y.time,y.signals.values(:,1),'r','LineWidth',2);
axis([0 12/400 -190 190]);
% figure(3);
hold on;
plot(Vlinha.time,Vlinha.signals.values(:,1),'k','LineWidth',4);
hold off;

xl = xlabel('tempo [s]');
set(xl,'Interpreter','Latex');
set(xl,'FontName','Times New Roman');
% set(xl,'FontAngle','italic');
set(xl,'FontSize',ftaxes);

yl = ylabel('Tensão [V]');
set(yl,'Interpreter','Latex');
set(yl,'FontName','Times New Roman');
% set(yl,'FontAngle','italic');
set(yl,'FontSize',ftaxes);

% l = legend('$v_a$','$i_{La}$','Location', 'NorthEast');
% set(l,'Interpreter','Latex');
% set(l,'FontName','Cambria');
% set(l,'FontAngle','italic');
% set(l,'FontSize',ft);
% set(l,'Box','off');

axis([0 6/400 -190 190]);
set(gca,'Position',[0.05,0.13,0.93,0.85]);
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1) pos(2) fatorX*pos(3) pos(4)*fatorY]);
set(gca,'XtickLabel',[],'YtickLabel',[]);

lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);

%% Plot 2

figure(2);
plot(y.time,115*sqrt(2)*sin(2*pi*f*t),'r','LineWidth',4);
axis([0 12/400 -190 190]);
% figure(3);
hold on;
plot(Vlinha.time,Vlinha.signals.values(:,1),'k','LineWidth',4);
hold off;

xl = xlabel('tempo [s]');
set(xl,'Interpreter','Latex');
set(xl,'FontName','Times New Roman');
% set(xl,'FontAngle','italic');
set(xl,'FontSize',ftaxes);

yl = ylabel('Tensão [V]');
set(yl,'Interpreter','Latex');
set(yl,'FontName','Times New Roman');
% set(yl,'FontAngle','italic');
set(yl,'FontSize',ftaxes);

% l = legend('$v_{a_{+1}}$','$v_{a}$','Location', 'NorthEast');
% set(l,'Interpreter','Latex');
% set(l,'FontName','Cambria');
% set(l,'FontAngle','italic');
% set(l,'FontSize',ft);
% set(l,'Box','off');

axis([0 6/400 -190 190]);
set(gca,'Position',[0.05,0.13,0.93,0.85]);
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1) pos(2) fatorX*pos(3) pos(4)*fatorY]);
set(gca,'XtickLabel',[],'YtickLabel',[]);

lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);

% %% plot 3
% 
% figure(3);
% plot(y.time,y.signals.values,'LineWidth',2.5);
% axis([0 12/400 -190 190]);
% % figure(3);
% % hold on;
% % plot(Vlinha.time,Vlinha.signals.values(:,1),'k','LineWidth',4);
% % hold off;
% 
% xl = xlabel('tempo [s]');
% set(xl,'Interpreter','Latex');
% set(xl,'FontName','Times New Roman');
% % set(xl,'FontAngle','italic');
% set(xl,'FontSize',ftaxes);
% 
% yl = ylabel('Tensão [V]');
% set(yl,'Interpreter','Latex');
% set(yl,'FontName','Times New Roman');
% % set(yl,'FontAngle','italic');
% set(yl,'FontSize',ftaxes);
% 
% % l = legend('$v_a$','$i_{La}$','Location', 'NorthEast');
% % set(l,'Interpreter','Latex');
% % set(l,'FontName','Cambria');
% % set(l,'FontAngle','italic');
% % set(l,'FontSize',ft);
% % set(l,'Box','off');
% 
% axis([0 6/400 -190 190]);
% set(gca,'Position',[0.065,0.13,0.925,0.85]);
% pos = get(gcf,'Position');
% set(gcf,'Position',[pos(1) pos(2) fatorX*pos(3) pos(4)*fatorY]);
% set(gca,'XtickLabel',[],'YtickLabel',[]);
% 
% lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
% set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);