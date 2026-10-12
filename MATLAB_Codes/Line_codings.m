clc; clear; close all;

% Input binary sequence
bits = [1 0 1 1 0 0 1 0];
N = length(bits);
sps = 100;                       % Samples per bit
t = 0:1/sps:N-1/sps;

% Unipolar NRZ
unipolar = repelem(bits, sps);

% Bipolar AMI
ami = zeros(1,N);
last = -1;
for k = 1:N
    if bits(k) == 1
        ami(k) = -last;
        last = ami(k);
    end
end
bipolar = repelem(ami, sps);

% Manchester (1: high-low, 0: low-high)
manchester = zeros(1,N*sps);
for k = 1:N
    manchester((k-1)*sps+1:k*sps/2) = 2*bits(k)-1;
    manchester((k-1)*sps+sps/2:k*sps) = -(2*bits(k)-1);
end

% Plot line coding schemes
figure;
subplot(3,2,1); plot(t,unipolar); axis([0 8 -1 2]) ; title('Unipolar NRZ'); grid on;
subplot(3,2,3); plot(t,bipolar) ; axis([0 8 -2 2]); title('Bipolar AMI'); grid on;
subplot(3,2,5); plot(t,manchester) ; axis([0 8 -2 2]); title('Manchester'); grid on;
xlabel('Time (s)');

% PSD using Welch method
Fs = sps;
[ P1,f ] = pwelch(unipolar,[],[],[],Fs);
[ P2,~ ] = pwelch(bipolar,[],[],[],Fs);
[ P3,~ ] = pwelch(manchester,[],[],[],Fs);

subplot(3,2,2); plot(f,10*log10(P1)); title('Unipolar PSD'); grid on;
subplot(3,2,4); plot(f,10*log10(P2)); title('Bipolar AMI PSD'); grid on;
subplot(3,2,6); plot(f,10*log10(P3)); title('Manchester PSD'); grid on;
xlabel('Frequency (Hz)');

