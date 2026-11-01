clc; clear; close all;

% Original continuous-time signal
fm = 5;                         % Message frequency
t = 0:0.0005:1;
x = sin(2*pi*fm*t);

% Sampling frequencies
fs = [6 10 20];
names = {'Undersampling','Critical Sampling','Oversampling'};

figure;

for i = 1:3

    % Sampling
    ts = 0:1/fs(i):1;
    xs = sin(2*pi*fm*ts);

    % Sinc reconstruction
    xr = zeros(size(t));
    for k = 1:length(ts)
        xr = xr + xs(k)*sinc(fs(i)*(t-ts(k)));
    end

    % Reconstruction error
    mse = mean((x-xr).^2);

    % Plot original and sampled signals
    subplot(3,2,2*i-1);
    plot(t,x,'b','LineWidth',1.2); hold on;
    stem(ts,xs,'r','filled');
    title([names{i},' (f_s = ',num2str(fs(i)),' Hz)']);
    xlabel('Time (s)'); ylabel('Amplitude');
    legend('Original','Samples');
    grid on;

    % Plot reconstructed signal
    subplot(3,2,2*i);
    plot(t,x,'b','LineWidth',1.2); hold on;
    plot(t,xr,'r--','LineWidth',1.2);
    title(['Reconstruction, MSE = ',num2str(mse,'%.4f')]);
    xlabel('Time (s)'); ylabel('Amplitude');
    legend('Original','Reconstructed');
    grid on;

    fprintf('%s: MSE = %.6f\n',names{i},mse);
end

sgtitle('Verification of Sampling Theorem');

