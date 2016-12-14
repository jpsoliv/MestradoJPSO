clear all 
close all 
clc

t = 0:0.001:3;
f = 1;
V = sin(2*pi*f*t);
I_l = 0.65*sin(2*pi*f*t-pi/4);

I_nl = abs(1.3*sin(2*pi*5*f*t));
I_nl(1:201)=0;
I_nl(301:701)=0;
I_nl(801:1201)=0;
I_nl(1301:1701)=0;
I_nl(1801:2201)=0;
I_nl(2301:2701)=0;
I_nl(2801:end)=0;

figure(1) %Figura Linear
plot(t,V,'k-',t,I_l,'b--','LineWidth',2);
axis([0 3 -1.8 1.8]);
set(gca,'Position',[0.05,0.08,0.9,0.9]);
legend1=legend('$v(t)$ [V]','$\,i(t)$ [A]');
set(legend1,'Location','SouthEast');
set(legend1,'FontSize',16);
set(legend1,'Interpreter','latex');
set(legend1,'FontName','Times New Roman');
set(legend1,'Box','off');;

xlabel('Tempo [s]','FontSize',18,'Interpreter','latex','FontName','Times New Roman');
% ylabel('Tens\~ao (V), Corrente (I)','FontSize',18,'Interpreter','latex','FontName','Times New Roman');
set(gca,'XtickLabel',[],'YtickLabel',[]);
%set(gca,'ygrid','on')
v = get(gca);
lh = line([0 0 NaN v.XLim],[v.YLim NaN 0 0 ]);
set(lh,'Color',[.52 .52 .52],'LineStyle','-','LineWidth',1);
uistack(lh,'bottom');

figure(2) %figura não linear

plot(t,V,'k-',t,I_nl,'b--','LineWidth',2);
axis([0 3 -1.8 1.8]);
set(gca,'Position',[0.05,0.08,0.9,0.9]);
legend2=legend('$v(t)$ [V]','$\,i(t)$ [A]');
set(legend2,'Location','SouthEast');
set(legend2,'FontSize',16);
set(legend2,'Interpreter','latex');
set(legend2,'FontName','Times New Roman');
set(legend2,'Box','off');

xlabel('Tempo [s]','FontSize',18,'Interpreter','latex','FontName','Times New Roman');
% ylabel('Tens\~ao (V), Corrente (I)','FontSize',18,'Interpreter','latex','FontName','Times New Roman');
set(gca,'XtickLabel',[],'YtickLabel',[]);
%set(gca,'ygrid','on')
v = get(gca);
lh = line([0 0 NaN v.XLim],[v.YLim NaN 0 0 ]);
set(lh,'Color',[.52 .52 .52],'LineStyle','-','LineWidth',1);
uistack(lh,'bottom');
