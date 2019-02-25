%% Test_Integrate_coeffs
N=3;
M=100;
f=@(x)1;
expected=zeros(N,1);
computed = Integrate_coeffs(f,N,M);
tol=eps*1e3*ones(N,1);
diff=abs(expected-computed);
for ii=1:N
assert(diff(ii,1) < tol(ii,1) ,'(y).');
end