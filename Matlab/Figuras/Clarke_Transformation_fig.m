clear all
close all
clc

ciclos  = 2;
f = 400;
t = 0:1e-7:ciclos*1/f;


Vrms = 115/sqrt(2);
Va = Vrms*sqrt(2)*sin(2*pi*f*t);
Vb = Vrms*sqrt(2)*sin(2*pi*f*t-2*pi/3);
Vc = Vrms*sqrt(2)*sin(2*pi*f*t-4*pi/3);

cl = sqrt(2/3)*[1/sqrt(2) 1/sqrt(2) 1/sqrt(2); 1 -1/2 -1/2;0 sqrt(3)/2 -sqrt(3)/2]*[Va;Vb;Vc];

V0 = cl(1,:);
Valpha = cl(2,:);
Vbeta = cl(3,:);

figure(1);
plot(t,Va,'k-',t,Vb,'b:',t,Vc,'r--','LineWidth',2.5);
% legend('Va','Vb','Vc');
ylim([-200 200]);
% xlabel('tempo [s]','FontSize',14);ylabel('Tens�o [V]','FontSize',14);
text(1/f*1.2,Vrms*1.65,'$v_a$','FontSize',20,'Interpreter','Latex');
text(1/f*1.53,Vrms*1.65,'$v_b$','FontSize',20,'Interpreter','Latex');
text(1/f*1.85,Vrms*1.65,'$v_c$','FontSize',20,'Interpreter','Latex');

xl = xlabel('tempo [s]');
set(xl,'Interpreter','Latex');
set(xl,'FontName','Times New Roman');
set(xl,'FontSize',18);

y1 = ylabel('Tens\~ao [V]');
set(y1,'Interpreter','Latex');
set(y1,'FontName','Times New Roman');
set(y1,'FontSize',18);


%grid on
set(gca,'XtickLabel',[],'YtickLabel',[]);
lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);


% 
% figure;
% plot(t,V0,t,Valpha,t,Vbeta);
% legend('V0','V\alpha','V\beta');
% 
% cl = sqrt(2/3)*[1 -1/2 -1/2;0 sqrt(3)/2 -sqrt(3)/2]*[Va;Vb;Vc];
% 
% Valpha = cl(1,:);
% Vbeta = cl(2,:);

figure(2);
plot(t,Valpha,'-',t,Vbeta,'--','LineWidth',2.5);
% legend('V\alpha','V\beta');
ylim([-200 200]);
% xlabel('tempo [s]','FontSize',14);ylabel('Tens�o [V]','FontSize',14);
text(1/f*1.2,Vrms*1.93,'$v_\alpha$','FontSize',20,'Interpreter','Latex');
text(1/f*1.48,Vrms*1.93,'$v_\beta$','FontSize',20,'Interpreter','Latex');
set(gca,'XtickLabel',[],'YtickLabel',[]);
lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);

x2 = xlabel('tempo [s]');
set(x2,'Interpreter','Latex');
set(x2,'FontName','Times New Roman');
set(x2,'FontSize',18);

y2 = ylabel('Tens\~ao [V]');
set(y2,'Interpreter','Latex');
set(y2,'FontName','Times New Roman');
set(y2,'FontSize',18);
