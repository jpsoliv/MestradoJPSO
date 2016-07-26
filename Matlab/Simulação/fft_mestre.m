function [y] = fft_mestre(X,T,f_rede)

% T = (t(end)/(length(t)-1));         % Sampling period
fs = 1/T;                           % Sampling frequency
m = length(X)                      % Window length
% n = pow2(nextpow2(m));            % Transform length
Y = fft(X);
y2 = abs(Y)/m;                      % DFT of signal
y1 = y2(1:floor(m/2)+1);
y1(2:end-1) = 2*y1(2:end-1);
f = fs*(0:(m/2))/m                 % Frequency range
% p = y.*conj(y)/n;                 % Power of the DFT

n = round(f_rede/(fs/m)) 

% figure;
semilogx(f,y1);

xlabel('Frequência (Hz)')
ylabel('Amplitude')

h =gca;
% h.XTick = [0 50 100 150 200];

% title('{\bf Component Frequencies of a Blue Whale B Call}')