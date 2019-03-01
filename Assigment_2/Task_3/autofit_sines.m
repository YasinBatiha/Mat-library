% Autofit sines
clc
clear all
close all
% Input parameters
f=@(t)1/pi*t;   % function to be approximated
N=3;    % number of coefficients
M=1000;  % number of elements 
filename='Autofit_plot';
% Plotting approximation beside exact function into file
for ii = 1:4
    subplot(1,4,ii)
    plot_approx(f, N, M, filename)
    title(['N = ',num2str(N),' '])
    N=N*2;
    print('ft','-djpeg')
end
figure
f=@(t)exp(pi-t);
N=100;
plot_approx(f, N, M, filename)
print('exp','-djpeg')
