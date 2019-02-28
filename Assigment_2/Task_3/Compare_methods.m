clc
clear all
close all
N=100;
M=1000;
f=@(x)exp(-(x-pi));
a=-pi;
b=pi;
% Matrix method
% A=ones(N);
A(1,1)=1;
for pp=2:N
A(pp,1)= Int_trapziodal(@(x)sin((pp-1)*x),a,b,M);
end
for pp=2:N
A(1,pp)= Int_trapziodal(@(x)sin((pp-1)*x),a,b,M);
end
for ii=2:N
    for jj=2:N
      A(ii,jj) = Int_trapziodal(@(x)sin((jj-1)*x)*sin((ii-1)*x),a,b,M);
    end
end
fc(1,1) = Int_trapziodal(f,a,b,M);
for ii=2:N
    fc(ii,1) = Int_trapziodal_fc(f,a,b,M,ii-1);
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


