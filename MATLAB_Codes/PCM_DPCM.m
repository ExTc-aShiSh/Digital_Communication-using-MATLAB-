clc; clear; close all;

% Signal generation
t = 0:0.001:1;
x = sin(2*pi*5*t);

% Sampling
Ts = 0.02;
ts = 0:Ts:1;
xs = sin(2*pi*5*ts);

% Quantization
L = 8;
xmin = min(xs); xmax = max(xs);
Delta = (xmax-xmin)/L;
xq = xmin + Delta*(floor((xs-xmin)/Delta)+0.5);

% PCM Encoding
indices = min(floor((xs-xmin)/Delta), L-1);
pcm = dec2bin(indices, log2(L));

% DPCM Encoding
d = [xs(1), diff(xs)];
dq = round(d/Delta)*Delta;
dpcm = dec2bin(mod(round((dq/Delta)), L), log2(L));

% Plots
subplot(3,1,1);
plot(t,x,'b'); hold on; stem(ts,xs,'r','filled');
title('Sampling'); legend('Original','Sampled'); grid on;

subplot(3,1,2);
stairs(ts,xq); title('PCM Quantization'); grid on;

subplot(3,1,3);
stem(ts,dq,'filled'); title('DPCM Quantized Differences'); grid on;
xlabel('Time (s)');
