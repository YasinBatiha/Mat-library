%% Test trapezoidal lin. function
a=1.2;  % left border of integration interval
b=4.4;  % right ...
n=1;    % number of elements
F=@(x)3*1e8*x.^2-4*1e6*x;   % Indefinite integral of testing function
f=@(x)6*1e8*x-4*1e6;    % testing function
computed=Int_trapziodal(f,a,b,n);   
expected=F(b)-F(a);
tol=eps(expected)*1e+2;    % tolerance
err=abs(expected-computed); % difference
assert(err<tol, computed);