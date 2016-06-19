close all
M = csvread('time_domain.csv',1,0);

t = M(:,1);
Vs = M(:,5);
Vpc = M(:,6);
Vline = M(:,7);

Is = M(:,2);

t = t-0.04;

%% plot Tensões
figure(1);
plot(t,Vpc,'k',t,Vs,'b--','LineWidth',2.5);
xlim([0 0.0075]);ylim([-200 200]);
xlabel('tempo [s]','FontSize',14);ylabel('Tensão [V]','FontSize',14);
text(2.1*0.0025,30,'V_B','FontSize',18);
text(2.4*0.0025,150,'V_S','FontSize',18);
%grid on
set(gca,'XtickLabel',[],'YtickLabel',[]);
lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);

figure(2);
plot(t,Vline,'k',t,Vs,'b--','LineWidth',2.5);
xlim([0 0.0075]);ylim([-200 200]);
xlabel('tempo [s]','FontSize',14);ylabel('Tensão [V]','FontSize',14);
text(2.5*0.0025,30,'V_G+V_L','FontSize',18);
text(2.4*0.0025,150,'V_S','FontSize',18);
%grid on
set(gca,'XtickLabel',[],'YtickLabel',[]);
lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);

%% Plot Corrente

figure;
plot(t,Is,'k',t,Vs,'b--','LineWidth',2.5);
xlim([0 0.0075]);ylim([-200 200]);
xlabel('tempo [s]','FontSize',14);ylabel('Corrente [A]','FontSize',14);
text(2.65*0.0025,20,'i_S','FontSize',18);
text(2.4*0.0025,150,'V_S','FontSize',18);
%grid on
set(gca,'XtickLabel',[],'YtickLabel',[]);set(lh,'Color',[.52 .52 .52],'LineStyle','-','LineWidth',1);
lh = line([0 0 NaN xlim],[ylim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);





