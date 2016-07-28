%% Plots
close all

ti = 0;
tf = 0.5;

% Tensão Gerador
figure(1)                   
subplot(3,1,1);
plot(Vint.time,Vint.signals.values);
xlim([ti tf]);
ylim([-200 200]);
title('V Interno');
grid on
subplot(3,1,2)
plot(Vterminal.time,Vterminal.signals.values);
xlim([ti tf]);
ylim([-200 200]);
title('Vterminal');
grid on
subplot(3,1,3)
plot(Vterminal.time,Vint.signals.values-Vterminal.signals.values);
xlim([ti tf]);
title('Vint-Vterminal');
grid on

% Tensão e corrente PCC
figure(2);
subplot(2,1,1);
plot(Vabc.time,Vabc.signals.values);
xlim([ti tf]);
ylim([-200 200]);
title('Vabc');
subplot(2,1,2);
plot(Iabc.time,Iabc.signals.values);
xlim([ti tf]);
title('Iabc');

% Tensão e corrente TRU
figure(3);
subplot(2,1,1);
plot(TRU_Vabc.time,TRU_Vabc.signals.values);
xlim([ti tf]);
ylim([-200 200]);
title('TRU_Vabc');
subplot(2,1,2);
plot(TRU_Iabc.time,TRU_Iabc.signals.values);
xlim([ti tf]);
title('TRU_Iabc');

% Tensão e corrente EHA
figure(4);
subplot(2,1,1);
plot(EHA_Vabc.time,EHA_Vabc.signals.values);
xlim([ti tf]);
ylim([-200 200]);
title('EHA_Vabc');
subplot(2,1,2);
plot(EHA_Iabc.time,EHA_Iabc.signals.values);
xlim([ti tf]);
title('EHA_Iabc');

% FFT janela
figure(5)
index_i = find(Vabc.time<=ti);
index_f = find(Vabc.time>=tf);
index_i = index_i(end);
index_f = index_f(1);
fft_mestre(Vabc.signals.values(index_i:index_f),Ts,f);

% % THD
% figure(6)
% plot(THD.time,THD.signals.values);
% xlim([ti tf]);
% ylim([-200 200]);
% title('THD');