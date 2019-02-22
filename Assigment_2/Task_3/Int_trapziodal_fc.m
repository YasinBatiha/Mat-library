function [I]=Int_trapziodal_fc(y,a,b,n,jj)
h=(b-a)/n;
I=h*(y(a)*sin(jj*a)+y(b)*sin(jj*b))/2;
for ii=1:1:(n-1)
    I=I+h*y(a+ii*h)*sin(jj*(a+ii*h));
end

