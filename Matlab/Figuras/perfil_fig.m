%% Coleta de dados
Vsignal = Vabc.signals.values;
Isignal = Iabc.signals.values;
time = Vabc.time;
f_rede = 400;

%% Definição de período
 
ini = find(time<=72.85);
fim = find(time>=time(end));

index_ini = ini(end);
index_fim = fim(1);

t = time(index_ini:index_fim);
V = Vsignal(index_ini:index_fim,:);
I = Isignal(index_ini:index_fim,:);

%% Perfil
T = 1/f_rede;

ini_p = find(time<=72.85);
fim_p = find(time>=72.85+T);

t_p = time(ini_p(end):fim_p(1));
I_p = Isignal(ini_p(end):fim_p(1),1);

periodo = zeros(round((time(fim)-72.85)/T),1);
periodo(1) = 72.85; 
for i=1:(time(fim)-72.85)/T
    periodo(i+1) = periodo(i)+T;
end

Pmax = zeros(round((time(fim)-72.85)/T),2);
Pmin = zeros(round((time(fim)-72.85)/T),2);
for i = 1:(time(fim)-72.85)/T
    
    ini_p = find(time<=periodo(i));
    fim_p = find(time>=periodo(i+1));
    
    t_p = time(ini_p(end):fim_p(1));
    I_p = Isignal(ini_p(end):fim_p(1),1);
    
    Pmax(i,1) = t_p(max(I_p)==I_p);
    Pmax(i,2) = max(I_p);
    Pmin(i,1) = t_p(min(I_p)==I_p);
    Pmin(i,2) = min(I_p);
end
Pmax(end,1) = time(end);
Pmax(end,2) = 0;
Pmin(end,1) = time(end);
Pmin(end,2) = 0;

%% plot
close all

ft = 30;
fatorX = 2;
fatorY = 1.05;
ftaxes = 18;

plot(Pmax(:,1),Pmax(:,2),'k',Pmin(:,1),Pmin(:,2),'k','LineWidth',2.5)
xlim([72.85 73.9]);
ylim([-250 250]);
set(gca,'Position',[0.06,0.15,0.93,0.7]);
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1) pos(2) fatorX*pos(3) pos(4)*fatorY]);
% set(gca,'XtickLabel',[],'YtickLabel',[]);
grid on

xl = xlabel('tempo [s]');
set(xl,'Interpreter','tex');
set(xl,'FontName','Times New Roman');
set(xl,'FontSize',ftaxes);

yl = ylabel('Perfil de Corrente [A]');
set(yl,'Interpreter','tex');
set(yl,'FontName','Times New Roman');
set(yl,'FontSize',ftaxes);

% Linhas Verticais
v = get(gca);
lh = line([0 0 NaN v.XLim],[v.YLim NaN 0 0 ]);
set(lh,'Color',[.25 .25 .25],'LineStyle','-','LineWidth',1);

lv1 = line([73 73],[v.YLim]);
set(lv1,'Color',[.0 .0 .0],'LineStyle','--','LineWidth',1);

lv2 = line([73.3 73.3],[v.YLim]);
set(lv2,'Color',[.0 .0 .0],'LineStyle','--','LineWidth',1);

lv3 = line([73.7 73.7],[v.YLim]);
set(lv3,'Color',[.0 .0 .0],'LineStyle','--','LineWidth',1);

% Textos

t1 = text((73+72.85)/2,255,{'EHA','Inoperante'});
set(t1,'VerticalAlignment','bottom');
set(t1,'HorizontalAlignment','center');
set(t1,'Interpreter','tex');
set(t1,'FontName','Times New Roman');
set(t1,'FontSize',ftaxes);

t2 = text((73+73.3)/2,255,'Corrente Máxima');
set(t2,'VerticalAlignment','bottom');
set(t2,'HorizontalAlignment','center');
set(t2,'Interpreter','tex');
set(t2,'FontName','Times New Roman');
set(t2,'FontSize',ftaxes);

t3 = text((73.3+73.7)/2,255,'Regime Transitório');
set(t3,'VerticalAlignment','bottom');
set(t3,'HorizontalAlignment','center');
set(t3,'Interpreter','tex');
set(t3,'FontName','Times New Roman');
set(t3,'FontSize',ftaxes);

t4 = text((73.7+73.9)/2,255,{'Regime','Permanente'});
set(t4,'VerticalAlignment','bottom');
set(t4,'HorizontalAlignment','center');
set(t4,'Interpreter','tex');
set(t4,'FontName','Times New Roman');
set(t4,'FontSize',ftaxes);
