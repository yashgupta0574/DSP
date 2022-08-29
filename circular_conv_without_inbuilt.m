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
 
U= [x, zeros(1,N)];
V= [y, zeros(1,N)];
N = 8;
Z=zeros(1,N);
for i=0:N-1
  for j=0:N-1
   k=mod(i-j,N); % modulo operation for circular shift
   Z(i+1)=Z(i+1)+U(j+1).*V(k+1);
end
end
subplot(3,1,3); % plotting signal z in discrete form
stem(n,Z,'LineWidth',2.5);
xlabel('Sample Values');
ylabel('Amplitude');
title('z(n) circular convoluted signal without using inbuilt function');
