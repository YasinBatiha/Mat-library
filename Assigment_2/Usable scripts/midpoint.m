function [I]=midpoint(y,a,b,n)
h=(b-a)/n;
% I=h*(y(a)+y(b))/2;
I=0;
for ii=1:1:(n-1)
    I=I+h*y(a+h/2+ii*h);
end