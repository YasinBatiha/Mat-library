%% Test trapezoidal lin. function
a=1.2;
b=4.4;
n=2;
F=@(x)3*1e8*x.^2-4*1e6*x;
f=@(x)6*1e8*x-4*1e6;
computed=Int_trapziodal(f,a,b,n);
expected=F(b)-F(a);
diff=eps(expected)*1e+2;
err=abs(expected-computed);
assert(err<diff, computed);