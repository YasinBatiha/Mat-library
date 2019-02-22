clc
clear all

N=100;
M=100;
f=@(x)exp(-(x-pi));
for ii=1:N
    for jj=1:N
      A(ii,jj) = trapezoidal(@(x)sin(jj*x)*sin(ii*x),-pi,pi,M);
    end
end
for pp=1:N
    fc(pp,1) = trapezoidal(@(x)sin(pp*x)*exp(-(x-pi)),-pi,pi,M);
end
for kk=1:N
b1(kk,1)=1/pi*(trapezoidal(@(x)sin(kk*x)*exp(-(x-pi)),-pi,pi,M));
end
b=A\fc;
t=(-pi:2*pi/M:pi)';
Sn=sinesum(t,b);
f1=f(t);
subplot(1,2,1)
plot(t,f1,'b')
hold on
plot(t,Sn,'r')
Sn1=sinesum(t,b1);
plot(t,Sn1,'g')
legend('exact','sines - matrix definition','bn individually')
title('N=100, M=100')

