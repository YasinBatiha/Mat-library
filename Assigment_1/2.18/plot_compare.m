%% This function plots the function and its sine aproximation to visual comparison
function plot_compare(f,N,M)
t1=(-pi:2*pi/M:pi)';
f1=f(t1);
% Looping the trial function 
while true
b=trial(N); 
Sn=sinesum(t1,b);   
E=error_s(b,f,M);   % Estimating error
fprintf('The error is E = %.2f \n ', E)
plot(t1,f1,'b')
hold on
plot(t1,Sn,'r')
legend('exact','sines')
c=input('Enter 0 to continue. \n ')
% Condition to break the trial function
if c
    break
end
end
end

    

