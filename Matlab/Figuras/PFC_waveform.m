close all
clear all
M = csvread('PFC_waveform.csv',1,0);

t = M(:,1);
unfilt = M(:,2);
filt = M(:,3);
V = 9*M(:,4);

figure(1);
plot(t,V,'k--',t,unfilt,'k','LineWidth',1.2);
legend1 = legend('Tens\~ao [V]','Corrente [A]');
set(legend1,'FontSize',14);
set(legend1,'Interpreter','latex');
set(legend1,'FontName','Times New Roman');
set(legend1,'Box','off');
line('LineWidth',1,'Color',[.7 .7 .7]);
xlim([1e-2 1.25e-2]);ylim([-1300 1300]);
xlabel('Tempo [s]','FontSize',18,'Interpreter','latex','FontName','Times New Roman');
set(gca,'XtickLabel',[],'YtickLabel',[]);

figure(2);
plot(t,V,'k--',t,filt,'k','LineWidth',1.2);
legend2 = legend('Tens\~ao [V]','Corrente [A]');
set(legend2,'FontSize',14);
set(legend2,'Interpreter','latex');
set(legend2,'FontName','Times New Roman');
set(legend2,'Box','off');
line('LineWidth',1,'Color',[.7 .7 .7]);
xlim([1e-2 1.25e-2]);ylim([-1300 1300]);
xlabel('Tempo [s]','FontSize',18,'Interpreter','latex','FontName','Times New Roman');
set(gca,'XtickLabel',[],'YtickLabel',[]);