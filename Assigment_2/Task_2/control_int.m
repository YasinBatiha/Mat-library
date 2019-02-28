clc
clear all
close all
% control
a=0;    % Right boundary
b=2;    % Left boundary
f=@(x)x.^0.5; % Function
method=0;   % Method=1 - Midpoint, Method=0 - Trapezoidal
eps=10^(-10); % Tolerance
% n is the number of elements
number_of_elements = adaptive_integration(f,a,b,eps,method)
