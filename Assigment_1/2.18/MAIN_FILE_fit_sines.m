clc
clear all
close all
% straight line
f=@(t)t/pi; % Function to be approximated
M=500;  % Number of time elements
N=3;    % Number of elements
tt=[-pi/2;pi/4]; % Testing time
bt=[4;-3];   % Testing coefficients

% Testing of sinesum function
test_sinesum(tt,bt)

% application of the trial function
plot_compare(f,N,M)

% Find the best approximation
b_bestfit=bestfit(f,M);  


