function [I]=midpoint_vec(y,a,b,n)
h=(b-a)/n;
t=linspace(a+h/2,b-h/2,n);
I=h*sum(y(t));
end

% I=h*(y(a)+y(b))/2;
% I=0;
% for ii=1:1:(n-1)
%     I=I+h*y(a+h/2+ii*h);
% end