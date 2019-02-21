clc
clear all
close all
% straight line
f=@(t)t/pi; % Function to be approximated
M=500;  % Number of time elements
N=2;
% % application of the trial function
% plot_compare(f,N,M)

% Find the best approximation
[B]=bestfit(f,M);  
b(1,1)=B(1,2);
b(2,1)=B(1,3);
b(3,1)=B(1,4);
t1=(-pi:2*pi/M:pi)';
f=f(t1);
Sn=sinesum(t1,b);

% Plot the results
plot(t1,f,'b')
hold on
plot(t1,Sn,'r')
legend('exact','sines')

