clc
clear all
close all
N=100;
M=10000;
f=@(x)exp(-(x-pi));
for ii=1:N
    for jj=1:N
      A(ii,jj) = Int_trapziodal(@(x)sin(jj*x)*sin(ii*x),-pi,pi,M);
    end
end
for ii=1:N
    fc(ii,1) = Int_trapziodal_fc(f,-pi,pi,M,ii);
end
b=A\fc;
t=(-pi:2*pi/M:pi)';
Sn=sinesum(t,b);
f1=f(t);
plot(t,f1,'b')
hold on
plot(t,Sn,'r')
legend('exact','sines')

