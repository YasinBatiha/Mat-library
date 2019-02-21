% cross_2_graphs
clc
clear all
close all

% Parameters setup
f=@(x)x^2;  % First function.
g=@(x)x;    % Second function.
N=input('Input the number of elements on the interval: \n ');   % Input 1
epsilon=input('Input the accuracy: \n ');   % Input 2
a=-4;   % Left border of the interval.
b=4;    % Right border of the interval.
n=a;    % Initial value of x.
c=1;    % Control value for 
% Checking function
for ii=1:1:N
    n=n+ii*(b-a)/N;
    if abs(f(n)-g(n))<epsilon
        fprintf('The solution is: x=%.4f. \n ',n)
        c=0;
    end
end
% Error message for the case, where the solution was not found.
if c
    fprintf('The solution was not found. \n ')
end

