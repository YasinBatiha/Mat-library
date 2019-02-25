% Autofit sines
clc
clear all
close all
% Input parameters
f=@(t)1/pi*t;   % function to be approximated
N=3;    % number of coefficients
M=100;  % number of elements 
filename='Autofit_plot';
% Plotting approximation beside exact function into file 
plot_approx(f, N, M, filename)