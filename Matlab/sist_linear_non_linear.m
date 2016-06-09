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
plot(t,V,'k-',t,I_l,'b--','LineWidth',2);axis([0 3 -2.1 2.1]);
legend1=legend('Tensão [V]','Corrente [A]');
set(legend1,'FontSize',14);
xlabel('Tempo [s]','FontSize',16);ylabel('Tensão (V), Corrente (I)','FontSize',16);
set(gca,'XtickLabel',[],'YtickLabel',[]);
%set(gca,'ygrid','on')
v = get(gca);
lh = line([0 0 NaN v.XLim],[v.YLim NaN 0 0 ]);
set(lh,'Color',[.52 .52 .52],'LineStyle','-','LineWidth',1);

figure(2) %figura não linear
plot(t,V,'k-',t,I_nl,'b--','LineWidth',2);axis([0 3 -2.1 2.1]);
legend2=legend('Tensão [V]','Corrente [A]');
set(legend2,'FontSize',14);
xlabel('Tempo [s]','FontSize',16);ylabel('Tensão (V), Corrente (I)','FontSize',16);
set(gca,'XtickLabel',[],'YtickLabel',[]);
%set(gca,'ygrid','on')
v = get(gca);
lh = line([0 0 NaN v.XLim],[v.YLim NaN 0 0 ]);
set(lh,'Color',[.52 .52 .52],'LineStyle','-','LineWidth',1);
