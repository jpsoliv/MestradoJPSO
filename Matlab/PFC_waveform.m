close all
clear all
M = csvread('PFC_waveform.csv',1,0);

t = M(:,1);
unfilt = M(:,2);
filt = M(:,3);
V = 9*M(:,4);

figure(1);
plot(t,V,'k--',t,unfilt,'k','LineWidth',1.2);
legend('Tensão [V]','Corrente [A]');
line('LineWidth',1,'Color',[.7 .7 .7]);
xlim([1e-2 1.25e-2]);ylim([-1300 1300]);
xlabel('Tempo [s]','FontSize',14);%ylabel('Amplitude [A]','FontSize',14);
set(gca,'XtickLabel',[],'YtickLabel',[]);

figure(2);
plot(t,V,'k--',t,filt,'k','LineWidth',1.2);
legend('Tensão [V]','Corrente [A]');
line('LineWidth',1,'Color',[.7 .7 .7]);
xlim([1e-2 1.25e-2]);ylim([-1300 1300]);
xlabel('Tempo [s]','FontSize',14);%ylabel('Amplitude [A]','FontSize',14);
set(gca,'XtickLabel',[],'YtickLabel',[]);