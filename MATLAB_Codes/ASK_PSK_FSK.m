clc; clear; close all;

% Parameters
bits = [1 0 1 1 0 1 0 0];
N = length(bits);
Tb = 1; Fs = 100;
t = 0:1/Fs:Tb-1/Fs;
fc = 5; f1 = 10; f0 = 5;
msg = repelem(bits, length(t));
tt = (0:length(msg)-1)/Fs;

% ASK Modulation (OOK)
ask = msg .* repelem(cos(2*pi*fc*t), N);

% FSK Modulation
fsk = zeros(1,length(msg));
for k = 1:N
    idx = (k-1)*length(t)+1:k*length(t);
    fsk(idx) = cos(2*pi*(f0+(f1-f0)*bits(k))*t);
end

% BPSK Modulation
bpsk = zeros(1,length(msg));
for k = 1:N
    idx = (k-1)*length(t)+1:k*length(t);
    bpsk(idx) = (2*bits(k)-1)*cos(2*pi*fc*t);
end

% Demodulation (correlation-based)
ask_rx = zeros(1,N); fsk_rx = zeros(1,N); bpsk_rx = zeros(1,N);
for k = 1:N
    idx = (k-1)*length(t)+1:k*length(t);
    ask_rx(k) = sum(ask(idx).*cos(2*pi*fc*t)) > 25;
    fsk_rx(k) = sum(fsk(idx).*cos(2*pi*f1*t)) > sum(fsk(idx).*cos(2*pi*f0*t));
    bpsk_rx(k) = sum(bpsk(idx).*cos(2*pi*fc*t)) > 0;
end

% BER (noiseless channel)
fprintf('ASK BER  = %.3f\n', mean(bits ~= ask_rx));
fprintf('FSK BER  = %.3f\n', mean(bits ~= fsk_rx));
fprintf('BPSK BER = %.3f\n', mean(bits ~= bpsk_rx));

% Plots
figure;
subplot(4,1,1); stairs(tt,msg); title('Binary Input'); ylim([-0.2 1.2]); grid on;
subplot(4,1,2); plot(tt,ask); title('ASK Modulated'); grid on;
subplot(4,1,3); plot(tt,fsk); title('FSK Modulated'); grid on;
subplot(4,1,4); plot(tt,bpsk); title('BPSK Modulated'); grid on;
xlabel('Time (s)');
