clc;
clear all;
close all;
t = 0:7;
y = cos(t*pi./2);
n = length(y);
p = nextpow2(n);
disp(p);
z = zeros(1,2^p-n);
x = [y z];
disp(x);
x1 = bitrevorder(x);
disp(x1)
n = length(x1);
s = log2(n)
w = exp(-2*1j*pi/n).^(0:(n/2)-1);
for i = 1:s
m = i;
for k = 1:2^m:n
for l = 0:2^(m-1)-1
a = x1(k+l);
b = x1(k+l+2^(m-1))*w(l*n/(2^m)+1);
x1(k+l)=a+b;
x1(k+l+2^(m-1)) = a-b;
end
end
end
x2 = fft(x); %inbuilt fast fourier transfer function
subplot(3,2,1); %for plot at position 1
stem(t,y,'LineWidth',2.5); %for plotting discrete input t with y
title("Input Signal");
axis([-1 8 -2 2]);
grid on;
subplot(3,2,2); %for plot at position 2
stem(t,angle(y),'LineWidth',2.5);%for plotting discrete input t with y
title("Input Phase plot"); %for naming title of plot
axis([-1 8 -5 5]);
grid on;
subplot(3,2,3); %for plot at position 3
stem(t,x1,'LineWidth',2.5);
title('DIT-FFT Without Using Inbuilt function');%for naming title of plot
xlabel('Frequency');
ylabel('Amplitude');
axis([-1 8 -5 5]);
grid on;
subplot(3,2,4); %for plot at position 4
stem(t,x2,'LineWidth',2.5); %for plotting discrete input t with x2
title('DIT-FFT Using Inbuilt function'); %for naming title of plot
xlabel('Frequency'); 
ylabel('Amplitude');
axis([-1 8 -5 5]);
grid on;
subplot(3,2,5); %for plot at position 5
stem(t,abs(x1),'LineWidth',2.5); %for plotting discrete input t with x1
title('Magnitude plot');
xlabel('Frequency');
ylabel('Amplitude');
axis([-1 8 -5 5]);
grid on;
subplot(3,2,6); %for plot at position 6
stem(t,angle(x2),'LineWidth',2.5);
title('Phase plot'); %for naming title of plot
xlabel('Frequency');
ylabel('Amplitude');
axis([-1 8 -5 5]);
grid on;
