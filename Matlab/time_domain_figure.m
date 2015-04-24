close all
M = csvread('time_domain.csv',1,0);

t = M(:,1);
Vs = M(:,5);
Vpc = M(:,6);
Vline = M(:,7);

Is = M(:,2);

t = t-0.04;

%% plot Tensões
figure;
plot(t,Vpc,'k',t,Vs,'b--','LineWidth',2.5);
xlim([0 0.0075]);ylim([-200 200]);
xlabel('tempo [s]','FontSize',14);ylabel('Tensão [V]','FontSize',14);
grid on
set(gca,'XtickLabel',[],'YtickLabel',[]);

figure;
plot(t,Vline,'k',t,Vs,'b--','LineWidth',2.5);
xlim([0 0.0075]);ylim([-200 200]);
xlabel('tempo [s]','FontSize',14);ylabel('Tensão [V]','FontSize',14);
grid on
set(gca,'XtickLabel',[],'YtickLabel',[]);

%% Plot Corrente

figure;
plot(t,Is,'k','LineWidth',2.5);
xlim([0 0.0075]);ylim([-200 200]);
xlabel('tempo [s]','FontSize',14);ylabel('Corrente [A]','FontSize',14);
grid on
set(gca,'XtickLabel',[],'YtickLabel',[]);





