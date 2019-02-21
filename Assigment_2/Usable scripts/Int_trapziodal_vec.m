function [I]=Int_trapziodal_vec(y,a,b,n)
h=(b-a)/n;
I=h*(y(a)+y(b))/2;
for ii=1:1:(n-1)
    I=I+h*y(a+(ii)*h);
end

