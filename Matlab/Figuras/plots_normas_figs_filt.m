% Carregar dados sem filtro


%% Coleta de dados
Vsignal = Vabc.signals.values;
Isignal = Iabc.signals.values;
time = Vabc.time;
f_rede = 400;

%% Definição de período

ti_inop = 72.85;        % inoperante
tf_inop = 72.945;

ti_max = 73;            % corrente max
tf_max = 73.3;

ti_rtrans = 73.3;       % Regime transitório
tf_rtrans = 73.7;

ti_rperm = 73.7;        % Regime permanente
tf_rperm = time(end);

% [V,I,t] = periodo(Vsignal,Isignal,time,ti,tf);

[V,I,t] = periodo(Vsignal,Isignal,time,ti_inop,tf_inop);

%% definição dos parâmetros das figuras

xtickfontsize = 13;     % Tamanho da fonte das escalas tanto em x com em y
ftaxes = 18;            % tamanho dos labels do eixo x e y 

% legendas são setada na própria função
%flag = 1; tensaocorrente
%flag = 2; ademais funções

%% Inoperante

[V,I,t] = periodo(Vsignal,Isignal,time,ti_inop,tf_inop);

fig = figure(1);
tensaocorrente(V,I,t);
xlim([t(1) t(end)]);
set(gca,'XTick',[t(1), t(1)+(t(end)-t(1))/4, t(1)+(t(end)-t(1))/4*2, t(1)+(t(end)-t(1))/4*3, t(1)+(t(end)-t(1))/4*4],'FontSize',xtickfontsize);
yyaxis left
ylim([-190 190]);
yyaxis right
ylim([-1.3 1.3]);
axesftsize(ftaxes,'tempo [s]','',1);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(2);
tensaocorrente(V,I,t);
xlim([t(end)-0.01 t(end)]);
set(gca,'XTick',[72.935, 72.935+0.0025 72.935+2*0.0025 72.935+3*0.0025 t(end)],'FontSize',xtickfontsize);
yyaxis left
ylim([-190 190]);
yyaxis right
ylim([-1.3 1.3]);
axesftsize(ftaxes,'tempo [s]','',1);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(3);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(1) t(end)]);
set(gca,'XTick',[t(1), t(1)+(t(end)-t(1))/4, t(1)+(t(end)-t(1))/4*2, t(1)+(t(end)-t(1))/4*3, t(1)+(t(end)-t(1))/4*4],'FontSize',xtickfontsize);
ylim([-200 200]);
axesftsize(ftaxes,'tempo [s]','Pot\^encias Instant\^aneas',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(4);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(end)-0.01 t(end)]);
set(gca,'XTick',[72.935, 72.935+0.0025 72.935+2*0.0025 72.935+3*0.0025 t(end)],'FontSize',xtickfontsize);
% xticks([72.935, 72.935+0.0025 72.935+2*0.0025 72.935+3*0.0025 t(end)]);
ylim([-200 200]);
axesftsize(ftaxes,'tempo [s]','Pot\^encias Instant\^aneas',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(5);
MILSTD704(t,V);
set(gca,'FontSize',xtickfontsize);
axesftsize(ftaxes,'Frequ\^encia [Hz]','Amplitude [$V_{rms}$]',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(6);
DO160(t,V,f_rede,0.5);
set(gca,'FontSize',xtickfontsize);
axesftsize(ftaxes,'Harm\^onica','Amplitude [$V_{rms}$]',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

%% Max Corrente

[V,I,t] = periodo(Vsignal,Isignal,time,ti_max,tf_max);

fig = figure(7);
tensaocorrente(V,I,t);
xlim([t(1) t(end)]);
set(gca,'FontSize',xtickfontsize);
yyaxis left
ylim([-190 190]);
yyaxis right
ylim([-400 400]);
axesftsize(ftaxes,'tempo [s]','',1);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(8);
tensaocorrente(V,I,t);
xlim([73.12 73.13]);
set(gca,'XTick',[73.12, 73.12+0.0025 73.12+2*0.0025 73.12+3*0.0025 73.13],'FontSize',xtickfontsize);
yyaxis left
ylim([-190 190]);
yyaxis right
ylim([-400 400]);
axesftsize(ftaxes,'tempo [s]','',1);
ylim([-400 400]);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(9);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(1) t(end)]);
set(gca,'FontSize',xtickfontsize);
ylim([-3e4 6.5e4]);
axesftsize(ftaxes,'tempo [s]','Pot\^encias Instant\^aneas',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(10);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([73.12 73.13]);
set(gca,'XTick',[73.12, 73.12+0.0025 73.12+2*0.0025 73.12+3*0.0025 73.13],'FontSize',xtickfontsize);
ylim([-3e4 6.5e4]);
axesftsize(ftaxes,'tempo [s]','Pot\^encias Instant\^aneas',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(11);
MILSTD704(t,V);
set(gca,'FontSize',xtickfontsize);
axesftsize(ftaxes,'Frequ\^encia [Hz]','Amplitude [$V_{rms}$]',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(12);
DO160(t,V,f_rede,17);
set(gca,'FontSize',xtickfontsize);
axesftsize(ftaxes,'Harm\^onica','Amplitude [$V_{rms}$]',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

%% Reg Transitório

[V,I,t] = periodo(Vsignal,Isignal,time,ti_rtrans,tf_rtrans);

fig = figure(13);
tensaocorrente(V,I,t);
xlim([t(1) t(end)]);
set(gca,'FontSize',xtickfontsize);
yyaxis left
ylim([-190 190]);
yyaxis right
ylim([-20 20]);
axesftsize(ftaxes,'tempo [s]','',1);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(14);
tensaocorrente(V,I,t);
xlim([t(1) t(1)+0.01]);
set(gca,'XTick',[t(1), t(1)+0.0025 t(1)+2*0.0025 t(1)+3*0.0025 t(1)+0.01],'FontSize',xtickfontsize);
yyaxis left
ylim([-190 190]);
yyaxis right
ylim([-20 20]);
axesftsize(ftaxes,'tempo [s]','',1);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(15);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(1) t(end)]);
set(gca,'FontSize',xtickfontsize);
ylim([-3000 5000]);
axesftsize(ftaxes,'tempo [s]','Pot\^encias Instant\^aneas',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(16);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(1) t(1)+0.01]);
set(gca,'XTick',[t(1), t(1)+0.0025 t(1)+2*0.0025 t(1)+3*0.0025 t(1)+0.01],'FontSize',xtickfontsize);
ylim([-3000 5000]);
axesftsize(ftaxes,'tempo [s]','Pot\^encias Instant\^aneas',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(17);
MILSTD704(t,V);
set(gca,'FontSize',xtickfontsize);
axesftsize(ftaxes,'Frequ\^encia [Hz]','Amplitude [$V_{rms}$]',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(18);
DO160(t,V,f_rede,1.5);
set(gca,'FontSize',xtickfontsize);
axesftsize(ftaxes,'Harm\^onica','Amplitude [$V_{rms}$]',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

%% Reg Permanente

[V,I,t] = periodo(Vsignal,Isignal,time,ti_rperm,tf_rperm);

fig = figure(19);
tensaocorrente(V,I,t);
xlim([t(1) t(end)]);
set(gca,'FontSize',xtickfontsize);
yyaxis left
ylim([-190 190]);
yyaxis right
ylim([-5 5]);
axesftsize(ftaxes,'tempo [s]','',1);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(20);
tensaocorrente(V,I,t);
xlim([t(1) t(1)+0.01]);
set(gca,'XTick',[t(1), t(1)+0.0025 t(1)+2*0.0025 t(1)+3*0.0025 t(1)+0.01],'FontSize',xtickfontsize);
yyaxis left
ylim([-190 190]);
yyaxis right
ylim([-5 5]);
axesftsize(ftaxes,'tempo [s]','',1);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(21);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(1) t(end)]);
set(gca,'FontSize',xtickfontsize);
ylim([-400 850]);
axesftsize(ftaxes,'tempo [s]','Pot\^encias Instant\^aneas',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(22);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(1) t(1)+0.01]);
set(gca,'XTick',[t(1), t(1)+0.0025 t(1)+2*0.0025 t(1)+3*0.0025 t(1)+0.01],'FontSize',xtickfontsize);
ylim([-400 850]);
axesftsize(ftaxes,'tempo [s]','Pot\^encias Instant\^aneas',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(23);
MILSTD704(t,V);
set(gca,'FontSize',xtickfontsize);
axesftsize(ftaxes,'Frequ\^encia [Hz]','Amplitude [$V_{rms}$]',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');

fig = figure(24);
DO160(t,V,f_rede,0.5);
set(gca,'FontSize',xtickfontsize);
axesftsize(ftaxes,'Harm\^onica','Amplitude [$V_{rms}$]',2);
n = get(fig,'Number');
print(['resultados_filt_',num2str(n)],'-depsc');