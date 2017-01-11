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

%% definição dos parâmetros das figuras

xtickfontsize = 13;     % Tamanho da fonte das escalas tanto em x com em y
ftaxes = 18;            % tamanho dos labels do eixo x e y 

% legendas são setada na própria função
%flag = 1; tensaocorrente
%flag = 2; ademais funções

%% Inoperante

[V,I,t] = periodo(Vsignal,Isignal,time,ti_inop,tf_inop);

% fig = figure(1);
% tensaocorrente(V,I,t);
% xlim([t(end)-0.01 t(end)]);
% set(gca,'XTick',[72.935, 72.935+0.0025 72.935+2*0.0025 72.935+3*0.0025 t(end)],'FontSize',xtickfontsize);
% yyaxis left
% ylim([-190 190]);
% yyaxis right
% ylim([-1.3 1.3]);
% axesftsize(ftaxes,'tempo [s]','',1);
% n = get(fig,'Number');
% print(['artigo_unfilt_',num2str(n)],'-depsc');

fig = figure(2);
MILSTD704_artigo(t,V,f_rede);
set(gca,'FontSize',xtickfontsize);
axesftsize(ftaxes,'Frequency [Hz]','Amplitude [$V_{rms}$]',2);
n = get(fig,'Number');
print(['artigo_unfilt_',num2str(n)],'-depsc');

%% Max Corrente

[V,I,t] = periodo(Vsignal,Isignal,time,ti_max,tf_max);

% fig = figure(7);
% tensaocorrente(V,I,t);
% xlim([t(1) t(end)]);
% set(gca,'FontSize',xtickfontsize);
% yyaxis left
% ylim([-190 190]);
% yyaxis right
% ylim([-400 400]);
% axesftsize(ftaxes,'time [s]','',1);
% n = get(fig,'Number');
% print(['artigo_unfilt_',num2str(n)],'-depsc');

fig = figure(11);
MILSTD704_artigo(t,V,f_rede);
set(gca,'FontSize',xtickfontsize);
axesftsize(ftaxes,'Frequency [Hz]','Amplitude [$V_{rms}$]',2);
n = get(fig,'Number');
print(['artigo_unfilt_',num2str(n)],'-depsc');
