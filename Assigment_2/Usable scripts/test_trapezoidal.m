%% Test trapezoidal exp. function
expected=2.463642041244344;
computed=Int_trapziodal(@(x)3*x^2*exp(x^3),0,1,2);
diff=eps(expected)*1e+2;
err=abs(expected-computed);
assert(err<diff, computed);

%% Test trapezoidal lin. function
expected=3*4.4^2-4*4.4-1.2^2*3+4*1.2;
y=@(x)6*x-4;
computed=Int_trapziodal(y,1.2,4.4,2);
diff=eps(expected)*1e+2;
err=abs(expected-computed);
assert(err<diff, computed);