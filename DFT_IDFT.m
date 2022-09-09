clc;
clear all;
%accept input
x = input('Enter input sequence');
N = input('Enter value of N=')
l = length(x);
n = 0:N-1;
%define n>=l generate error
if(N<l)
    error('value of n should be greater than l')
end
%padd n-l zeros
x = [x zeros(1, N-l)];
subplot(3,2,1);
stem(n,x);
xlabel('Time Sample');
ylabel('Amplitude');
title('padded input signal');
%multiply padded sequence with twiddle factor
y = zeros(1, N);
for i = 0:N-1
    for k = 0:N-1
        y(k+1) = y(k+1) + x(i+1).*exp(-j*2*pi*k*i/N);
    end
end

disp('y = ')
disp(y)
k1 = 0:N-1;
subplot(3,2,2);
stem(k1,y);
xlabel('Time Sample');
ylabel('Amplitude');
title('DFT signal');

real_y = abs(y);
subplot(3, 2, 3)
stem(k1,real_y)
xlabel('Time Sample');
ylabel('Amplitude');
title('magnitude of transformed signal');

real_y = phase(y);
subplot(3, 2, 4)
stem(k1,real_y)
xlabel('Time Sample');
ylabel('Amplitude');
title('phase of transformed signal');

m = zeros(1, N);
for i = 0:N-1
    for k = 0:N-1
        m(k+1) = m(k+1) + x(i+1).*exp(j*2*pi*k*i/N);
    end
end

subplot(3, 2, 5);
stem(k1,m);
xlabel('Time Sample');
ylabel('Amplitude');
title('IDFT of transformed signal');