close all
M = csvread('FFT.csv',1,0);

f = M(:,2);
%Vs = M(:,5);
Vpc = M(:,3);
%Vline = M(:,7);

%Is = M(:,2);

%t = t-0.04;

bar(f,Vpc,2,'k');
xlim([0 15000]);
xlabel('Harm\^onica','FontSize',18,'Interpreter','latex','FontName','Times New Roman');
ylabel('Amplitude [V]','FontSize',18,'Interpreter','latex','FontName','Times New Roman');
%grid on
set(gca,'XtickLabel',[],'YtickLabel',[]);