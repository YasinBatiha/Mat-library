function [I]=Int_trapziodal_vec(y,a,b,n)
h=(b-a)/n;
xi=a+h:h:b-h;
yxi=y(xi);
I=h*(y(a)+y(b))/2;
I=I+sum(yxi);
