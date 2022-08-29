clc;
clear all;
close all;
m1=0:6; % time duration of signal x
x=m1/3; % amplitude of signal x 
m2=-2:2; % time duration of signal y
y=ones(1,length(m2)); % amplitude of signal y 
subplot(3,1,1); % plotting signal x in discrete form
stem(m1,x,'LineWidth',2.5);
xlabel('m1 values');
ylabel('Amplitude');
title('x(n)');
subplot(3,1,2); % plotting signal y in discrete form
stem(m2,y,'LineWidth',2.5);
xlabel('m2 values');
ylabel('Amplitude');
title('y(n)');
n1=length(x); % length of signal x
n2=length(y); % length of signal y
N=n1+n2-1; % length of signal z
m3=0:1:N-1;
x1=[x, zeros(1,N-n1)]; % zero padding to make the length N
y1=[y, zeros(1,N-n2)]; % zero padding to make the length N
z=zeros(1,N); % initializing the output to zero
% performing linear convolution 
for n=1:N
 z(1)=0;
 for k=1:N
 if(k<n+1)
 z(n)=z(n)+x1(k)*y1(n-k+1);
 end
end
end
disp(z);
subplot(3,1,3); %plotting convoluted signal (z) in discrete form
stem(m3,z,'LineWidth',3.5);
xlabel('m3 values');
ylabel('Amplitude');
title('z(n) linear convoluted without inbuilt function');