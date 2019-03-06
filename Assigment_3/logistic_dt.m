% Ex 4.4 Find an appropriate time step: logistic model
clc
% Parameters
y0=100;
dt0=15;
tn=60;
r=0.1;
M=500;
ydot=@(t,y)r*(1-y/M)*y;
Max_steps=10;
% Code
max=tn/(2^(-Max_steps)*dt0)+1;
t=zeros(max,Max_steps);
y=zeros(max,Max_steps);
max_local=zeros(Max_steps,1);
max_local(1)=tn/dt0+1;
[t(1:max_local(1),1),y(1:max_local(1),1)] = Euler_ODE(y0,ydot,dt0,tn);

for kk=1:Max_steps
    dt=2^(-kk)*dt0;
    max_local(kk+1)=tn/dt+1;
    [t(1:max_local(kk+1),kk+1),y(1:max_local(kk+1),kk+1)] = Euler_ODE(y0,ydot,dt,tn);
    close all
    plot(t(1:max_local(kk),kk),y(1:max_local(kk),kk))
    hold on
    plot(t(1:max_local(kk+1),kk+1),y(1:max_local(kk+1),kk+1))
    legend(['dt = ', num2str(dt*2) ,''],['dt = ', num2str(dt) ,''])
    q=input('If you are not satisfied and want to continue, please enter 1. \n ');
    c=kk;
    if q~=1
        break
    end
end
if c>(Max_steps-1)
    fprintf('If you want to continue, then there is probably something wrong with you... \n ')
end