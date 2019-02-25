clc
clear all
close all
N=50;
M=1000;
f=@(x)1/pi*x;
% Matrix method
for ii=1:N
    for jj=1:N
      A(ii,jj) = Int_trapziodal(@(x)sin(jj*x)*sin(ii*x),-pi,pi,M);
    end
end
for ii=1:N
    fc(ii,1) = Int_trapziodal_fc(f,-pi,pi,M,ii);
end
b=A\fc;

% Method from task b)
for kk=1:N
b1(kk,1)=1/pi*Int_trapziodal_fc(f,-pi,pi,M,kk);
end

% Plotting results
t=(-pi:2*pi/M:pi)';
Sn=sinesum(t,b);
f1=f(t);
plot(t,f1,'b')
hold on
plot(t,Sn,'r')
Sn1=sinesum(t,b1);
plot(t,Sn1,'g')
legend('exact','sines - matrix definition','bn individually')
title('Sines sum - comparison of methods')


