clc;
clear all;
close all;
x = [1 1 1 1 1 1 0 0 1];
N = length(x);
n = 0:1:N-1;
subplot(5,1,1);
stem(n,x,'LineWidth',2.5);
xlabel('N values');
ylabel('Amplitude');
title('x(n)');

y = fft(x, N);
subplot(5,1,2);
stem(n,y,'LineWidth',2.5);
xlabel('N values');
ylabel('Amplitude');
title('DFT y(n)');

z = abs(y)
subplot(5,1,3);
stem(n,z,'LineWidth',2.5);
xlabel('N values');
ylabel('Amplitude');
title('Magnitude Plot y(n)');

w = angle(y)
subplot(5,1,4);
stem(n,w,'LineWidth',2.5);
xlabel('N values');
ylabel('Amplitude');
title('Phase Plot y(n)');

w = ifft(y, N);
subplot(5,1,5);
stem(n,w,'LineWidth',2.5);
xlabel('N values');
ylabel('Amplitude');
title('IDFT y(n)');


