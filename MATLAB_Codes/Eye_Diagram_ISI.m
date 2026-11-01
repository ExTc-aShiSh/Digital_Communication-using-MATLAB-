clc; clear; close all;

% Parameters
N = 1000;                   % Number of bits
sps = 20;                   % Samples per symbol
SNR = [30 15 5];             % SNR values in dB

% Binary data (Bipolar NRZ)
bits = randi([0 1],1,N);
symbols = 2*bits-1;
x = repelem(symbols,sps);

% Channel impulse responses
h1 = 1;                     % No ISI
h2 = [0.5 1 0.5];           % ISI channel

figure;

for i = 1:3

    % Apply channel
    if i == 1
        y = conv(x,h1,'same');
    else
        y = conv(x,h2,'same');
    end

    % Add AWGN
    Ps = mean(y.^2);
    noise = sqrt(Ps/10^(SNR(i)/10))*randn(size(y));
    r = y + noise;

    % Eye diagram
    subplot(3,1,i);
    hold on;

    for k = 1:2*sps:length(r)-2*sps
        plot((0:2*sps-1)/sps,r(k:k+2*sps-1));
    end

    title(['Eye Diagram: SNR = ',num2str(SNR(i)),' dB']);
    xlabel('Time (Symbol Periods)');
    ylabel('Amplitude');
    grid on;
    xlim([0 2]);
end

sgtitle('Eye Diagram: Effects of ISI and SNR');

