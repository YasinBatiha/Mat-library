% Function approximating function and plotting results for visual ...
% control.
function plot_approx(f, N, M, filename)
b = Integrate_coeffs(f,N,M);    % getting approximation coefficents
t=(-pi:2*pi/M:pi)'; % defining the plotting interval
Sn=sinesum(t,b);    % calculating the approximated function
% Plottig results
f1=f(t);
plot(t,f1,'b')
hold on
plot(t,Sn,'k')
legend('Exact','Sines approximation')
title('Sines Approximation')
print(filename,'-djpeg')
end