%% This function computes error of approximation on interval [-pi,pi]
function E=error_s(b,f,M)
E=0;
t1=(-pi:(2*pi/M):pi)';
f=f(t1);
Sn=sinesum(t1,b);
for ii=1:1:length(t1)
    E=E+(f(ii,1)-Sn(ii,1))^2;
end
E=sqrt(E);
