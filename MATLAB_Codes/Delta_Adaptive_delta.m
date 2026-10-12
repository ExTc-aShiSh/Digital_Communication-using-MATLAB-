clc; clear; close all;

% Message signal
t = 0:0.001:1;
x = sin(2*pi*2*t);
N = length(x);
Delta = 0.05;

% Delta Modulation (DM)
y = zeros(1,N);
e = zeros(1,N);
for k = 2:N
    e(k) = x(k) - y(k-1);
    if e(k) >= 0
        y(k) = y(k-1) + Delta;
    else
        y(k) = y(k-1) - Delta;
    end
end

% Adaptive Delta Modulation (ADM)
ya = zeros(1,N);
Da = 0.02;
Dmin = 0.005; Dmax = 0.1;
for k = 2:N
    eA = x(k) - ya(k-1);
    if k > 2 && sign(x(k)-x(k-1)) == sign(x(k-1)-x(k-2))
        Da = min(Da*1.5,Dmax);
    else
        Da = max(Da/1.5,Dmin);
    end
    if eA >= 0
        ya(k) = ya(k-1) + Da;
    else
        ya(k) = ya(k-1) - Da;
    end
end

% Error analysis
errDM = x-y;
errADM = x-ya;
fprintf('DM Mean Square Error  = %.5f\n',mean(errDM.^2));
fprintf('ADM Mean Square Error = %.5f\n',mean(errADM.^2));

% Waveforms
figure;
subplot(2,1,1);
plot(t,x,'b',t,y,'r--');
title('Delta Modulation'); legend('Original','Reconstructed'); grid on;

subplot(2,1,2);
plot(t,x,'r',t,ya,'g--');
title('Adaptive Delta Modulation'); legend('Original','Reconstructed'); grid on;

figure;
plot(t,errDM,'r',t,errADM,'g');
title('Error Comparison'); legend('DM Error','ADM Error');
xlabel('Time (s)'); ylabel('Error'); grid on;

