clear all
% close all
clc
t = 0:0.001:1;
f = 2.25;
phi = pi/2.5;
w = 2*pi*f;
Vrms = 1.2;
Irms = Vrms/1.5;
d1 = 1.8;
d2 = -1.8;

V = sqrt(2)*Vrms*cos(w*t);
I = sqrt(2)*Irms*cos(w*t-phi);

P = V.*I;

Pp = Vrms.*Irms*cos(phi).*(1+cos(2*w*t));
Pq = Vrms.*Irms*sin(phi).*sin(2*w*t);

Lpos1 = [0.6553    0.1286    0.2463    0.1079];

hFig1 = figure(1);
set(hFig1,'units','centimeters');
set(hFig1,'Position',[6 6 13*1.61803+5.6553 13]);

plot(t,V+d1,'k-.',t,I+d1,'b--',t,P+d1,'r-',t,Pp+d2,'k-.',t,Pq+d2,'b--',t,Pp+Pq+d2,'r-','LineWidth',2);
axis([min(t) max(t) min(Pq)+d2-0.4 max(V)+d1+0.4])
set(gca,'XtickLabel',[],'YtickLabel',[]);
l1 = legend('$v(t)$ $V I \cos(\phi)[1+\cos(2\omega t)]$','$i(t)$ $VI\sin(\phi)\sin(2\omega t)$','$p(t)$ P Q');
set(l1,'Interpreter','Latex')
set(l1,'Box','off');
set(l1,'Location','northeastoutside');
set(l1,'FontSize',14);
set(l1,'FontAngle','italic')
set(l1,'FontName','Cambria')
% set(l1,'Position',Lpos1);
% l2 = legend('v(t) ','i(t)','p(t)');
% set(l2,'Box','off');
% set(l2,'Location','southeastoutside');
% set(l2,'FontSize',14);
% set(l2,'FontAngle','italic')
% set(l2,'FontName','Cambria')


v = get(gca);
lh1 = line([0 0 NaN v.XLim],[v.YLim NaN d1 d1 ]);               %Eixo tensões 
set(lh1,'Color',[.52 .52 .52],'LineStyle','-','LineWidth',1);
uistack(lh1,'bottom');

lh2 = line([0 0 NaN v.XLim],[v.YLim NaN d2 d2 ]);                 % Eixo potencias
set(lh2,'Color',[.52 .52 .52],'LineStyle','-','LineWidth',1);
uistack(lh2,'bottom');
lh3 = line([NaN 0 NaN v.XLim],[v.YLim NaN max(Pp)/2+d2 max(Pp)/2+d2]);
set(lh3,'Color','black','LineStyle',':','LineWidth',1);
lh4 = line([NaN 0 NaN v.XLim],[v.YLim NaN max(Pq)+d2 max(Pq)+d2]);
set(lh4,'Color','black','LineStyle',':','LineWidth',1);

lv1 = line([min(t(find(P<0))) min(t(find(P<0)))], ylim);
set(lv1,'Color',[.0 .0 .0],'LineStyle',':','LineWidth',1);
lv2 = line([max(t(find(P<0&t<1/f/2))) max(t(find(P<0&t<1/f/2)))], ylim);
set(lv2,'Color',[.0 .0 .0],'LineStyle',':','LineWidth',1);





% hFig2 = figure(2);
% set(hFig2,'units','centimeters');
% set(hFig2,'Position',[6 6 12*1.61803 12]);
% plot(t,Pp,'k-.',t,Pq,'b--',t,Pp+Pq,'r-','LineWidth',2);
% l = legend('Potência Ativa [W]','Potência Reativa [VAr]','Potencia Aparente [VA]');
% set(l,'Box','off');
% set(l,'Location','southeast');
% set(l,'FontSize',9);
% set(l,'Position',Lpos);
% axis([min(t) max(t) -1.3 1.3])
% set(gca,'XtickLabel',[],'YtickLabel',[]);
% v = get(gca);
% lh = line([0 0 NaN v.XLim],[v.YLim NaN 0 0 ]);
% set(lh,'Color',[.52 .52 .52],'LineStyle','-','LineWidth',1);
% uistack(lh,'bottom');
% lh = line([NaN 0 NaN v.XLim],[v.YLim NaN max(Pp)/2 max(Pp)/2]);
% set(lh,'Color','black','LineStyle',':','LineWidth',1);
