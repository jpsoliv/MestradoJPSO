close all
clear all
M = csvread('PFC_waveform.csv',1,0);

t = M(:,1);
unfilt = M(:,2);
filt = M(:,3);

figure(1);
plot(t,unfilt,'k','LineWidth',1);
xlim([1e-2 1.25e-2]);
xlabel('Tempo [s]','FontSize',14);ylabel('Corrente [A]','FontSize',14);
set(gca,'XtickLabel',[],'YtickLabel',[]);

figure(2);
plot(t,filt,'k','LineWidth',1);
xlim([1e-2 1.25e-2]);
xlabel('Tempo [s]','FontSize',14);ylabel('Corrente [A]','FontSize',14);
set(gca,'XtickLabel',[],'YtickLabel',[]);