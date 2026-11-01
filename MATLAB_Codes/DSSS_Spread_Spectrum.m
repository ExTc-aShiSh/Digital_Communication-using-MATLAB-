clc;clear;close all;

%% Parameters
N = 10;                  % Number of data bits
SF = 7;                  % Spreading factor
SNR_dB = 5;               % Signal-to-noise ratio

%% Binary Data Generation
data = randi([0 1],1,N);
data_nrz = 2*data-1;      % Convert bits to +1 and -1

%% PN Sequence Generation using 3-bit LFSR
pn = zeros(1,SF);
reg = [1 0 1];            % Initial LFSR state

for k = 1:SF
    pn(k) = reg(3);
    feedback = xor(reg(3),reg(1));
    reg = [feedback reg(1:2)];
end

pn_nrz = 2*pn-1;          % Convert PN bits to +1 and -1

%% DSSS Spreading
spread_signal = kron(data_nrz,pn_nrz);

%% Add AWGN
noise_power = mean(spread_signal.^2)/10^(SNR_dB/10);
rx_signal = spread_signal + sqrt(noise_power)*randn(size(spread_signal));

%% Despreading
rx_matrix = reshape(rx_signal,SF,N);
despread_signal = sum(rx_matrix.*pn_nrz.',1);

recovered_data = despread_signal > 0;

%% Display Results
fprintf('Original Data:   ');
disp(data);

fprintf('PN Sequence:     ');
disp(pn);

fprintf('Recovered Data:  ');
disp(recovered_data);

fprintf('BER = %.4f\n',mean(data ~= recovered_data));

%% Plot Original Data
figure;
stairs(0:N-1,data,'LineWidth',1.5);
grid on;
xlabel('Bit Index');
ylabel('Amplitude');
title('Original Binary Data');
ylim([-0.2 1.2]);

%% Plot PN Sequence
figure;
stairs(0:SF-1,pn,'LineWidth',1.5);
grid on;
xlabel('Chip Index');
ylabel('Amplitude');
title('Generated PN Sequence');
ylim([-0.2 1.2]);

%% Plot Spread Signal
figure;
plot(spread_signal,'LineWidth',1.2);
axis ([0 70 -1.5 1.5])
grid on;
xlabel('Chip Index');
ylabel('Amplitude');
title('DSSS Spread Signal');

%% Plot Received Signal
figure;
plot(rx_signal);
grid on;
xlabel('Chip Index');
ylabel('Amplitude');
title(['Received DSSS Signal with AWGN (SNR = ',num2str(SNR_dB),' dB)']);

%% Plot Recovered Data
figure;
stairs(0:N-1,recovered_data,'LineWidth',1.5);
grid on;
xlabel('Bit Index');
ylabel('Amplitude');
title('Recovered Binary Data');
ylim([-0.2 1.2]);

