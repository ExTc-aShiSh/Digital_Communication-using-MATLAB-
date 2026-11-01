clc;clear;close all;
%% Parameters
N = 20; Tb = 1; Fs = 100;
t = 0:1/Fs:Tb-1/Fs;
L = length(t);
A = 1; fc = 5;
SNR_dB = 5;

%% BPSK Signal Generation
bits = randi([0 1],1,N);
reference = A*cos(2*pi*fc*t);

tx_signal = repelem(2*bits-1,L).*repmat(reference,1,N);

%% Add AWGN
noise_power = mean(tx_signal.^2)/10^(SNR_dB/10);
rx_signal = tx_signal + sqrt(noise_power)*randn(size(tx_signal));

%% Matched Filter Receiver
mf_output = conv(rx_signal,fliplr(reference));
mf_samples = mf_output(L:L:N*L);
detected_mf = mf_samples > 0;

%% Correlator Receiver
rx_matrix = reshape(rx_signal,L,N);
corr_output = sum(rx_matrix.*reference.',1);
detected_corr = corr_output > 0;

%% BER Calculation
BER_MF = mean(bits ~= detected_mf);
BER_CORR = mean(bits ~= detected_corr);

%% Display Results
fprintf('Transmitted Bits: ');
disp(bits);

fprintf('Matched Filter Detected Bits: ');
disp(detected_mf);

fprintf('Correlator Detected Bits: ');
disp(detected_corr);

fprintf('Matched Filter BER = %.4f\n',BER_MF);
fprintf('Correlator BER = %.4f\n',BER_CORR);

%% Transmitted and Received Signals
figure;
subplot(2,1,1);
plot((0:length(tx_signal)-1)/Fs,tx_signal);
axis ([0 20 -2 2])
grid on;
xlabel('Time (s)'); ylabel('Amplitude');
title('Transmitted BPSK Signal');

subplot(2,1,2);
plot((0:length(rx_signal)-1)/Fs,rx_signal);
grid on;
xlabel('Time (s)'); ylabel('Amplitude');
title(['Received Signal with AWGN, SNR = ',num2str(SNR_dB),' dB']);

%% Matched Filter Output
figure;
plot(mf_output);
hold on;
for k = 1:N
    xline(k*L,'--r');
end
grid on;
xlabel('Sample Index'); ylabel('Amplitude');
title('Matched Filter Output');

%% Correlator Output
figure;
stem(1:N,corr_output,'filled');
grid on;
xlabel('Bit Index'); ylabel('Correlation Value');
title('Correlator Receiver Output');

%% Detected Bits Comparison
figure;
subplot(2,1,1);
stem(1:N,double(detected_mf),'filled');
ylim([-0.2 1.2]);
grid on;
xlabel('Bit Index'); ylabel('Detected Bit');
title('Matched Filter Detection');

subplot(2,1,2);
stem(1:N,double(detected_corr),'filled');
ylim([-0.2 1.2]);
grid on;
xlabel('Bit Index'); ylabel('Detected Bit');
title('Correlator Receiver Detection');

