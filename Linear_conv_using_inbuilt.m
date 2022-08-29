clc;
clear all;
close all;
m1=0:1:6; % time duration of signal x
x=m1/3; % amplitude of signal x 
m2=-2:2; % time duration of signal y
y=ones(1,length(m2)); % amplitude of signal y
n1=length(x); %length of signal x
n2=length(y); %length of signal y
N=n1+n2-1; %length of signal z (convoluted signal)
subplot(3,1,1) %plotting signal x in discrete form
stem(m1,x,'LineWidth',2.5);
xlabel('m1 values');
ylabel('Amplitude');
title('x(n)');
subplot(3,1,2); %plotting signal y in discrete form
stem(m2,y,'LineWidth',2.5);
xlabel('m1 values');
ylabel('Amplitude');
title('y(n)');
z = conv(x,y); % convolution function for convoluting signals x and y
l3 = 0:1:N-1;
subplot(3,1,3); %plotting signal z in discrete form
stem(l3,z,'LineWidth',3.5);
xlabel('N values');
ylabel('Amplitude');
title('z(n) linear convoluted with inbuilt function');
