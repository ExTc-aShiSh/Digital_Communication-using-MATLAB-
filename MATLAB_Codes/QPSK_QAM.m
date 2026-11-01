clc;clear;close all;

%% Parameters
N = 100000;                  % Number of bits
SNR_dB = 0:2:20;             % SNR range
bits = randi([0 1], N, 1);   % Random binary data

%% ================= QPSK MODULATION =================

% Ensure even number of bits
bits_QPSK = bits(1:2*floor(N/2));

% QPSK mapping
b = reshape(bits_QPSK, 2, []).';

tx_QPSK = ((1-2*b(:,1)) + 1j*(1-2*b(:,2)))/sqrt(2);

% QPSK constellation diagram
figure;
plot(real(tx_QPSK(1:1000)), imag(tx_QPSK(1:1000)), 'o');
grid on;
axis([-0.8 0.8 -0.8 0.8]);
xlabel('In-phase');
ylabel('Quadrature');
title('QPSK Constellation Diagram');

%% QPSK BER Calculation

BER_QPSK = zeros(size(SNR_dB));

for k = 1:length(SNR_dB)

    % AWGN generation
    noise = sqrt(1/(2*10^(SNR_dB(k)/10))) * ...
        (randn(size(tx_QPSK)) + 1j*randn(size(tx_QPSK)));

    rx = tx_QPSK + noise;

    % QPSK demodulation
    rx_bits = zeros(length(rx), 2);

    rx_bits(:,1) = real(rx) < 0;
    rx_bits(:,2) = imag(rx) < 0;

    rx_bits = reshape(rx_bits.', [], 1);

    % BER calculation
    BER_QPSK(k) = mean(bits_QPSK ~= rx_bits);

end

%% ================= 16-QAM MODULATION =================

% Ensure bit count is divisible by 4
bits_QAM = bits(1:4*floor(N/4));

% 16-QAM Gray-coded mapping
b = reshape(bits_QAM, 4, []).';

levels = [-3 -1 3 1];

I = levels(2*b(:,1) + b(:,2) + 1);
Q = levels(2*b(:,3) + b(:,4) + 1);

% Normalize average symbol energy
tx_QAM = (I + 1j*Q)/sqrt(10);

% 16-QAM constellation diagram
figure;
plot(real(tx_QAM(1:1000)), imag(tx_QAM(1:1000)), 'o');
grid on;
axis ([-1.4 1.4 -1 1]);
xlabel('In-phase');
ylabel('Quadrature');
title('16-QAM Constellation Diagram');

%% 16-QAM BER Calculation

BER_QAM = zeros(size(SNR_dB));

% Reference constellation
[I_ref, Q_ref] = meshgrid(levels, levels);
ref = (I_ref(:) + 1j*Q_ref(:))/sqrt(10);
ref = ref(:);

% Gray bit mapping corresponding to levels
grayBits = [0 0;
            0 1;
            1 0;
            1 1];

for k = 1:length(SNR_dB)

    % AWGN generation
    noise = sqrt(1/(2*10^(SNR_dB(k)/10))) * ...
        (randn(size(tx_QAM)) + 1j*randn(size(tx_QAM)));

    rx = tx_QAM + noise;

    % Nearest constellation point detection
    rx = rx(:);
    dist = abs(rx - ref.').^2;

    [~, idx] = min(dist, [], 2);

    % Recover I and Q indices
    Iidx = mod(idx-1, 4) + 1;
    Qidx = floor((idx-1)/4) + 1;

    % Recover transmitted bits
    rx_bits = [grayBits(Iidx,:) grayBits(Qidx,:)];
    rx_bits = reshape(rx_bits.', [], 1);

    % BER calculation
    BER_QAM(k) = mean(bits_QAM ~= rx_bits);

end

%% ================= BER COMPARISON =================

figure;

semilogy(SNR_dB, BER_QPSK, '-o', 'LineWidth', 1.5);
hold on;

semilogy(SNR_dB, BER_QAM, '-s', 'LineWidth', 1.5);

grid on;
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
title('BER Performance of QPSK and 16-QAM');

legend('QPSK', '16-QAM');