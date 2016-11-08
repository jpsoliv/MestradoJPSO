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

%% Inoperante

[V,I,t] = periodo(Vsignal,Isignal,time,ti_inop,tf_inop);

fig = figure(1);
tensaocorrente(V,I,t);
xlim([t(1) t(end)]);
ylim([-0.15 0.15]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(2);
tensaocorrente(V,I,t);
xlim([t(end)-0.01 t(end)]);
ylim([-0.15 0.15]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(3);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(1) t(end)]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(4);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(end)-0.01 t(end)]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(5);
MILSTD704(t,V);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(6);
DO160(t,V,f_rede);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

%% Max Corrente

[V,I,t] = periodo(Vsignal,Isignal,time,ti_max,tf_max);

fig = figure(7);
tensaocorrente(V,I,t);
xlim([t(1) t(end)]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(8);
tensaocorrente(V,I,t);
xlim([73.12 73.13]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(9);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(1) t(end)]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(10);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([73.12 73.13]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(11);
MILSTD704(t,V);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(12);
DO160(t,V,f_rede);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

%% Reg Transitório

[V,I,t] = periodo(Vsignal,Isignal,time,ti_rtrans,tf_rtrans);

fig = figure(13);
tensaocorrente(V,I,t);
xlim([t(1) t(end)]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(14);
tensaocorrente(V,I,t);
xlim([t(1) t(1)+0.01]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(15);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(1) t(end)]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(16);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(1) t(1)+0.01]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(17);
MILSTD704(t,V);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(18);
DO160(t,V,f_rede);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

%% Reg Permanente

[V,I,t] = periodo(Vsignal,Isignal,time,ti_rperm,tf_rperm);

fig = figure(19);
tensaocorrente(V,I,t);
xlim([t(1) t(end)]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(20);
tensaocorrente(V,I,t);
xlim([t(1) t(1)+0.01]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(21);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(1) t(end)]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(22);
[~,~,~]=aparente(t,V,I,'unfilt');
xlim([t(1) t(1)+0.01]);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(23);
MILSTD704(t,V);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');

fig = figure(24);
DO160(t,V,f_rede);
n = get(fig,'Number');
print(['resultados_unfilt_',num2str(n)],'-depsc');





