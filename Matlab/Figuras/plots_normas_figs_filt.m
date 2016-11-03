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

figure(1);
tensaocorrente(V,I,t);
xlim([ti_inop tf_inop]);

figure(2);
tensaocorrente(V,I,t);
xlim([tf_inop-0.01 tf_inop]);

figure(3);
[P,Q,S]=aparente(t,V,I,'filt');
xlim([ti_inop tf_inop]);

figure(4);
[~,~,~]=aparente(t,V,I,'filt');
xlim([tf_inop-0.01 tf_inop]);

figure(5);
MILSTD704(t,V);

figure(6);
DO160(t,V,f_rede);






