clear all 
close all 
clc

f = 1;
T = 4;
vp = 115;
ip = 60;
t = linspace(0,T/f,50000);
Ts = t(end)/length(t);

va = vp*sin(2*pi*f*t);
vb = vp*sin(2*pi*f*t-2*pi/3);
vc = vp*sin(2*pi*f*t+2*pi/3);
sft = pi/6;

% figure(1)
% plot(t,va,t,vb,t,vc)

ia = zeros(1,length(t));
ib = zeros(1,length(t));
ic = zeros(1,length(t));

% ia(find(va>=vb&va>vc)+round(sft*round(length(t)/T)/(2*pi)))=ip;
% ia(find(va<vb&va<=vc)+round(sft*round(length(t)/T)/(2*pi)))=-ip;
% ib(find(vb>=va&vb>vc)+round(sft*round(length(t)/T)/(2*pi)))=ip;
% ib(find(vb<va&vb<=vc)+round(sft*round(length(t)/T)/(2*pi)))=-ip;
% ic(find(vc>=va&vc>vb)+round(sft*round(length(t)/T)/(2*pi)))=ip;
% ic(find(vc<va&vc<=vb)+round(sft*round(length(t)/T)/(2*pi)))=-ip;

ia(find(va>=vb&va>vc))=ip;
ia(find(va<vb&va<=vc))=-ip;
ib(find(vb>=va&vb>vc))=ip;
ib(find(vb<va&vb<=vc))=-ip;
ic(find(vc>=va&vc>vb))=ip;
ic(find(vc<va&vc<=vb))=-ip;

ia = circshift(ia,[0,round(sft*round(length(t)/T)/(2*pi))]);
ib = circshift(ib,[0,round(sft*round(length(t)/T)/(2*pi))]);
ic = circshift(ic,[0,round(sft*round(length(t)/T)/(2*pi))]);

% ia(length(t)+1:length(ia))=[];
% ib(length(t)+1:length(ib))=[];
% ic(length(t)+1:length(ic))=[];


% ia(1:length(ia)/2)=0;
% ib(1:length(ib)/2)=0;
% ic(1:length(ic)/2)=0;

%% Clarke Transformation

V0 = sqrt(2/3)*((1/sqrt(2)*va + 1/sqrt(2)*vb + 1/sqrt(2)*vc));
Valpha = sqrt(2/3)*(1*va - 1/2*vb - 1/2*vc);
Vbeta = sqrt(2/3)*(0*va + sqrt(3)/2*vb - sqrt(3)/2*vc);

I0 = sqrt(2/3)*(1/sqrt(2)*ia + 1/sqrt(2)*ib + 1/sqrt(2)*ic);
Ialpha = sqrt(2/3)*(1*ia - 1/2*ib - 1/2*ic);
Ibeta = sqrt(2/3)*(0*ia + sqrt(3)/2*ib - sqrt(3)/2*ic);

% figure;
% plot(t,V0,t,Valpha,t,Vbeta); title('V_0, V_{\alpha}, V_{\beta}');legend('V_0','V_{\alpha}','V_{\beta}');
% figure;
% plot(t,I0,t,Ialpha,t,Ibeta);title('I_0, I_{\alpha}, I_{\beta}');legend('I_0','I_{\alpha}','I_{\beta}');

%% P-Q theory

% P0 = V0.*I0;
P1 = Valpha.*Ialpha + Vbeta.*Ibeta;
Q1 = Vbeta.*Ialpha - Valpha.*Ibeta;


% P = Valpha.*Ialpha+Vbeta.*Ibeta+V0.*I0;
% qalpha = Vbeta.*I0-V0.*Ibeta;
% qbeta = V0.*Ialpha-Valpha.*I0;
% q0 = -Valpha.*Ibeta-Vbeta.*Ialpha;

%% Filtering

f = 2;
% fsample = 1/2e-7;
fsample = 1/Ts;

[b,a] = butter(4,f/(fsample/2),'low');

Pbar = filter(b,a,P1);

%% Power Selection
% P = Pbar+Ptil
% Pbar = Potencia ativa;

Ptil = P1-Pbar;

Ptil(1:length(Ptil)*1/3)=0;
Ptil(length(Ptil)*5/6:length(Ptil)) = 0;
Q = Q1;
Q(1:length(Q)*1/3)=0;
Q(length(Q)*5/6:length(Q)) = 0;
 
% figure;
% plot(t,Pbar,t,Ptil,t,P);legend('Pbar','Ptil','P');


%%  Current Correction

% I0_p = -P0./V0;
Ialpha_p = 1./(Valpha.^2+Vbeta.^2).*(-Valpha.*Ptil - Vbeta.*Q);
Ibeta_p = 1./(Valpha.^2+Vbeta.^2).*(-Vbeta.*Ptil + Valpha.*Q);

% Vab0quad = Valpha.^2+Vbeta.^2+V0.^2;

% Ialpha_p = 1./Vab0quad.*(Valpha.*-Ptil+V0.*-qbeta-Vbeta.*-q0);
% Ibeta_p = 1./Vab0quad.*(Vbeta.*-Ptil-V0.*-qalpha+Valpha.*-q0);
% I0_p = 1./Vab0quad.*(V0.*-Ptil+Vbeta.*-qalpha-Valpha.*-qbeta);
% figure;
% plot(t,Ialpha_p,t,Ibeta_p);


%% Inverse Clarke Transformation

% Ia_p = sqrt(2/3)*(1/sqrt(2)*I0_p + Ialpha_p);
% Ib_p = sqrt(2/3)*(1/sqrt(2)*I0_p - 1/2*Ialpha_p + sqrt(3)/2*Ibeta_p);
% Ic_p = sqrt(2/3)*(1/sqrt(2)*I0_p - 1/2.*Ialpha_p - sqrt(3)/2.*Ibeta_p);

Ia_p = sqrt(2/3)*(Ialpha_p);
Ib_p = sqrt(2/3)*(- 1/2*Ialpha_p + sqrt(3)/2*Ibeta_p);
Ic_p = sqrt(2/3)*(- 1/2.*Ialpha_p - sqrt(3)/2.*Ibeta_p);

% figure;
% subplot(3,1,1);
% plot(t,Ia_p);legend('Ia_p');
% subplot(3,1,2);
% plot(t,ia);legend('ia');
% subplot(3,1,3);
% plot(t,ia+Ia_p);legend('ia+Ia_p');

%% Active Filtering

Ia = ia+Ia_p;
Ib = ib+Ib_p;
Ic = ic+Ic_p;

% figure
% plot(t,Ia,t,Ib,t,Ic);

%% plots

ft = 30;
fatorX = 2;
fatorY = 0.9;
ftaxes = 24;

figure(1)
plot(t,va,t,ia,'LineWidth',2.5);

xl = xlabel('tempo [s]');
set(xl,'Interpreter','Latex');
set(xl,'FontName','Times New Roman');
% set(xl,'FontAngle','italic');
set(xl,'FontSize',ftaxes);

yl = ylabel({'Tensão [V]';'Corrente [A]'});
set(yl,'Interpreter','Latex');
set(yl,'FontName','Times New Roman');
% set(yl,'FontAngle','italic');
set(yl,'FontSize',ftaxes);

l = legend('$v_a$','$i_{La}$','Location', 'NorthEast');
set(l,'Interpreter','Latex');
set(l,'FontName','Cambria');
set(l,'FontAngle','italic');
set(l,'FontSize',ft);
set(l,'Box','off');

axis([0 t(end) -150 150]);
set(gca,'Position',[0.065,0.13,0.925,0.85]);
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1) pos(2) fatorX*pos(3) pos(4)*fatorY]);
set(gca,'XtickLabel',[],'YtickLabel',[]);

lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);

figure(2);
plot(t,P1,t,Q1,'LineWidth',2.5);
xl = xlabel('tempo [s]');
set(xl,'Interpreter','Latex');
set(xl,'FontName','Times New Roman');
set(xl,'FontAngle','italic');
set(xl,'FontSize',ftaxes);

yl = ylabel({'Potência Ativa [W]';'Potência Reativa [vai]'});
set(yl,'Interpreter','Latex');
set(yl,'FontName','Times New Roman');
% set(yl,'FontAngle','italic');
set(yl,'FontSize',ftaxes);

l = legend('$p$','$q$','Location', 'SouthEast');
set(l,'Interpreter','Latex');
set(l,'FontName','Cambria');
set(l,'FontAngle','italic');
set(l,'FontSize',ft);
set(l,'Box','off');
axis([0 t(end) -14000 14000]);
set(gca,'Position',[0.065,0.13,0.925,0.85]);
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1) pos(2) fatorX*pos(3) pos(4)*fatorY]);
set(gca,'XtickLabel',[],'YtickLabel',[]);
lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);

figure(3);
plot(t,-Ptil,t,-Q,'LineWidth',2.5);

xl = xlabel('tempo [s]');
set(xl,'Interpreter','Latex');
set(xl,'FontName','Times New Roman');
set(xl,'FontAngle','italic');
set(xl,'FontSize',ftaxes);

yl = ylabel({'Potência Ativa [W]';'Potência Reativa [vai]'});
set(yl,'Interpreter','Latex');
set(yl,'FontName','Times New Roman');
% set(yl,'FontAngle','italic');
set(yl,'FontSize',ftaxes);

l = legend('$-\tilde{p}$','$-q$','Location', 'SouthEast');
set(l,'Interpreter','Latex');
set(l,'FontName','Cambria');
set(l,'FontAngle','italic');
set(l,'FontSize',ft);
set(l,'Box','off');
tx = text(t(end)*1/3,-14000,'$t_i$');
set(tx,'Interpreter','Latex');
set(tx,'FontName','Cambria');
set(tx,'FontAngle','italic');
set(tx,'FontSize',ft);
set(tx,'HorizontalAlignment','center');
set(tx,'VerticalAlignment','bottom');
tx = text(t(end)*5/6,-14000,'$t_f$');
set(tx,'Interpreter','Latex');
set(tx,'FontName','Cambria');
set(tx,'FontAngle','italic');
set(tx,'FontSize',ft);
set(tx,'HorizontalAlignment','center');
set(tx,'VerticalAlignment','bottom');
axis([0 t(end) -14000 14000]);
set(gca,'Position',[0.065,0.13,0.925,0.85]);
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1) pos(2) fatorX*pos(3) pos(4)*fatorY]);
set(gca,'XtickLabel',[],'YtickLabel',[]);
lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);

figure(4)
plot(t,Ia_p,'LineWidth',2.5);

xl = xlabel('tempo [s]');
set(xl,'Interpreter','Latex');
set(xl,'FontName','Times New Roman');
set(xl,'FontAngle','italic');
set(xl,'FontSize',ftaxes);

yl = ylabel('Corrente [A]');
set(yl,'Interpreter','Latex');
set(yl,'FontName','Times New Roman');
% set(yl,'FontAngle','italic');
set(yl,'FontSize',ftaxes);

l = legend('$i_{Ca}$','Location', 'NorthEast');
set(l,'Interpreter','Latex');
set(l,'FontName','Cambria');
set(l,'FontAngle','italic');
set(l,'FontSize',ft);
set(l,'Box','off');
tx = text(t(end)*1/3,-150,'$t_i$');
set(tx,'Interpreter','Latex');
set(tx,'FontName','Cambria');
set(tx,'FontAngle','italic');
set(tx,'FontSize',ft);
set(tx,'HorizontalAlignment','center');
set(tx,'VerticalAlignment','bottom');
tx = text(t(end)*5/6,-150,'$t_f$');
set(tx,'Interpreter','Latex');
set(tx,'FontName','Cambria');
set(tx,'FontAngle','italic');
set(tx,'FontSize',ft);
set(tx,'HorizontalAlignment','center');
set(tx,'VerticalAlignment','bottom');
axis([0 t(end) -150 150]);
set(gca,'Position',[0.065,0.13,0.925,0.85]);
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1) pos(2) fatorX*pos(3) pos(4)*fatorY]);
set(gca,'XtickLabel',[],'YtickLabel',[]);
lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);

% figure(5);
% plot(t,Ia,'LineWidth',2.5);
% l = legend('$i_{Sa}$','Location', 'NorthEast');
% set(l,'Interpreter','Latex');
% set(l,'FontName','Cambria');
% set(l,'FontAngle','italic');
% set(l,'FontSize',ft);
% set(l,'Box','off');
% axis([0 t(end) -150 150]);
% set(gca,'Position',[0.05,0.05,0.9,0.9]);
% pos = get(gcf,'Position');
% set(gcf,'Position',[pos(1) pos(2) fatorX*pos(3) pos(4)*fatorY]);
% set(gca,'XtickLabel',[],'YtickLabel',[]);
% lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
% set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);

figure(6);
plot(t,va,'--',t,Ia,'LineWidth',2.5);

xl = xlabel('tempo [s]');
set(xl,'Interpreter','Latex');
set(xl,'FontName','Times New Roman');
set(xl,'FontAngle','italic');
set(xl,'FontSize',ftaxes);

yl = ylabel({'Tensão [V]';'Corrente [A]'});
set(yl,'Interpreter','Latex');
set(yl,'FontName','Times New Roman');
% set(yl,'FontAngle','italic');
set(yl,'FontSize',ftaxes);

l = legend('$v_a$','$i_{Sa}$','Location', 'NorthEast');
set(l,'Interpreter','Latex');
set(l,'FontName','Cambria');
set(l,'FontAngle','italic');
set(l,'FontSize',ft);
set(l,'Box','off');
tx = text(t(end)*1/3,-150,'$t_i$');
set(tx,'Interpreter','Latex');
set(tx,'FontName','Cambria');
set(tx,'FontAngle','italic');
set(tx,'FontSize',ft);
set(tx,'HorizontalAlignment','center');
set(tx,'VerticalAlignment','bottom');
tx = text(t(end)*5/6,-150,'$t_f$');
set(tx,'Interpreter','Latex');
set(tx,'FontName','Cambria');
set(tx,'FontAngle','italic');
set(tx,'FontSize',ft);
set(tx,'HorizontalAlignment','center');
set(tx,'VerticalAlignment','bottom');
axis([0 t(end) -150 150]);
set(gca,'Position',[0.065,0.13,0.925,0.85]);
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1) pos(2) fatorX*pos(3) pos(4)*fatorY]);
set(gca,'XtickLabel',[],'YtickLabel',[]);
lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1)

figure(7)
plot(t,va.*Ia+vb.*Ib+vc.*Ic,t,sqrt((vb.*Ic-vc.*Ib).^2+(vc.*Ia-va.*Ic).^2+(va.*Ib-vb.*Ia).^2),'LineWidth',2.5);

xl = xlabel('tempo [s]');
set(xl,'Interpreter','Latex');
set(xl,'FontName','Times New Roman');
set(xl,'FontAngle','italic');
set(xl,'FontSize',ftaxes);

yl = ylabel({'Potência Ativa [W]';'Potência Reativa [vai]'});
set(yl,'Interpreter','Latex');
set(yl,'FontName','Times New Roman');
% set(yl,'FontAngle','italic');
set(yl,'FontSize',ftaxes);

l = legend('$p_S$','$q_S$','Location', 'SouthEast');
set(l,'Interpreter','Latex');
set(l,'FontName','Cambria');
set(l,'FontAngle','italic');
set(l,'FontSize',ft);
set(l,'Box','off');
tx = text(t(end)*1/3,-14000,'$t_i$');
set(tx,'Interpreter','Latex');
set(tx,'FontName','Cambria');
set(tx,'FontAngle','italic');
set(tx,'FontSize',ft);
set(tx,'HorizontalAlignment','center');
set(tx,'VerticalAlignment','bottom');
tx = text(t(end)*5/6,-14000,'$t_f$');
set(tx,'Interpreter','Latex');
set(tx,'FontName','Cambria');
set(tx,'FontAngle','italic');
set(tx,'FontSize',ft);
set(tx,'HorizontalAlignment','center');
set(tx,'VerticalAlignment','bottom');
axis([0 t(end) -14000 14000]);
set(gca,'Position',[0.065,0.13,0.925,0.85]);
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1) pos(2) fatorX*pos(3) pos(4)*fatorY]);
set(gca,'XtickLabel',[],'YtickLabel',[]);
lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1)
% figure
% subplot(3,1,1);
% plot(t,Ia,t,va);
% subplot(3,1,2);
% plot(t,Ib,t,vb);
% subplot(3,1,3);
% plot(t,Ic,t,vc);
% 
% figure
% subplot(2,1,1);
% plot(t,va,t,vb,t,vc,t,ia,t,ib,t,ic);
% subplot(2,1,2);
% plot(t,va,t,vb,t,vc,t,ia,t,ib,t,ic);