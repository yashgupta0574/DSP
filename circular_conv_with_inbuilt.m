clc;
clear all;
close all;
 
n = 0:1:7;
N = 8;
x = cos(2*pi*n/N)
subplot(3,1,1); % plotting signal x in discrete form
stem(n,x,'LineWidth',2.5);
xlabel('Sample Values');
ylabel('Amplitude');
title('x(n)');
 
y = sin(2*pi*n/N)
subplot(3,1,2); % plotting signal y in discrete form
stem(n,y,'LineWidth',2.5);
xlabel('Sample Values');
ylabel('Amplitude');
title('y(n)');
 
z = cconv(x,y,N) % using in-built circular convolution function
subplot(3,1,3); %plotting signal z in discrete form
stem(n,z,'LineWidth',2.5);
xlabel('Sample Values');
ylabel('Amplitude');
title('z(n) circular convoluted signal using inbuilt function');