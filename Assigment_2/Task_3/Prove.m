clc
clear all
close all
N=3;   % number of coefficients
M=100; % number of elements
f=@(x)x/pi; % function to be approximated
% calulating matrix A from equation A times b =fc
for ii=1:N
    for jj=1:N
      A(ii,jj) = Int_trapziodal(@(x)sin(jj*x)*sin(ii*x),-pi,pi,M);
    end
end
% calculating vector fc
for pp=1:N
    fc(pp,1) = Int_trapziodal_fc(f,-pi,pi,M,pp);
end
% solving system of linear equations and getting coefficients b
b=A\fc;
% solving coefficeints by formula from 3.12 b)
for kk=1:N
b1(kk,1)=1/pi*(Int_trapziodal_fc(f,-pi,pi,M,kk));
end
diff=b-b1
% plotting results
% t=(-pi:2*pi/M:pi)';
% Sn=sinesum(t,b);
% f1=f(t);
% plot(t,f1,'b','LineWidth',0.5)
% hold on
% plot(t,Sn,'r','LineWidth',1.5)
% Sn1=sinesum(t,b1);
% plot(t,Sn1,'g','LineWidth',1)
% legend('Exact','Matrix definition','bn individually')
% title('Approximation')


