function r = convergence_rate(y,a,b,n_exp)
E = zeros(n_exp,1);
r = zeros(n_exp,1);
for i = 1:n_exp
    n=2^i;
    Int_trapziodal(y,a,b,n)
end
end
