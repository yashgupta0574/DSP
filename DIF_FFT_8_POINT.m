clc;
clear all;
close all;
t = 1:7;
x = sin(pi.*t/2);
n = length(x);
p = nextpow2(n);
z= zeros(1,2^p -n);
x = [x ,z];
xn = x;
N = length(x);
for j = p:-1:1
L = 2^(j);
for k = 1:L: N-L+1
for n = 0 :(L/2)-1
w = exp((-1i*2*pi*n)/L);
A = x(n+k);
B = x(n+k+L/2);
x(n+k) = A+B;
x(n+k+L/2) = (A-B)*w;
end
end
end
y = bitrevorder(x);
q = fft(xn);
n = 0:N-1;
subplot(4,1,1);
stem(n,xn,'LineWidth',2.5);
title('Input Signal');
axis([-1 8 -2 2]);
grid on;
subplot(4,2,3);
stem(n,y,'LineWidth',2.5);
title('Magnitude plot without using in-built function');
%axis([-1 8 -10 5]);
grid on;
subplot(4,2,4);
stem(n,angle(y),'LineWidth',2.5);
title('Phase plot withput using inbuilt function');
axis([-1 8 -2 2]);
grid on;
subplot(4,2,5);
stem(n,q,'LineWidth',2.5);
title('Magnitude plot using in-built function');
%axis([-1 8 -10 5]);
grid on;
subplot(4,2,6);
stem(n,angle(q),'LineWidth',2.5);
title('Phase plot using inbuilt function');
axis([-1 8 -2 2]);
grid on;
%IDFT
for j = p:-1:1
L = 2^(j);
for k = 1:L: N-L+1
for n = 0 :(L/2)-1
w = exp((-1i*2*pi*n)/L);
A = y(n+k);
B = y(n+k+L/2);
y(n+k) = A+B;
y(n+k+L/2) = (A-B)*w;
end
end
end
y = y/N;
y = bitrevorder(y);
subplot(4,1,4);
stem(y,'LineWidth',2.5);
title('IDFT output');
axis([-1 8 -2 2]);
