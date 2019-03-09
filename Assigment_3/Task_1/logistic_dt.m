% Ex 4.4 Find an appropriate time step: logistic model
clc
% Parameters
y0=100; % inititla condition
dt0=15; % initial time step
tn=60;  % time interval is from 0 to tn
r=0.1;  % parameter of the logistic model
 M=500;  % parameter of the logistic model
ydot=@(t,y)r*(1-y/M)*y; % logistic model
Max_steps=10;   % code constraint
% Initializing matrixes matrixes to 
max=tn/(2^(-Max_steps)*dt0)+1;  % Maximum number of nodes
t=zeros(max,Max_steps); % time matrix
y=zeros(max,Max_steps); % computed values matrix
max_local=zeros(Max_steps,1);   % number of nodes for actual approximation
max_local(1)=tn/dt0+1;  % number of nodes for the first computation
[t(1:max_local(1),1),y(1:max_local(1),1)] = Euler_ODE(y0,ydot,dt0,tn);  % the first approximation
% algorithm for plotting and asking
for kk=1:Max_steps
    dt=2^(-kk)*dt0; % actual time step
    max_local(kk+1)=tn/dt+1;
    [t(1:max_local(kk+1),kk+1),y(1:max_local(kk+1),kk+1)] = Euler_ODE(y0,ydot,dt,tn);
    close all
    % Plotting results
    plot(t(1:max_local(kk),kk),y(1:max_local(kk),kk))
    hold on
    plot(t(1:max_local(kk+1),kk+1),y(1:max_local(kk+1),kk+1))
    legend(['dt = ', num2str(dt*2) ,''],['dt = ', num2str(dt) ,''])
    title('Logistic model')
    xlabel('t [min]')
    ylabel('N[-]')
    % asking to continue
    q=input('If you are not satisfied and want to continue, please enter 1. \n ');
    c=kk;
    if q~=1
        break
    end
end
% Coder defined condition
if c>(Max_steps-1)
    fprintf('If you want to continue, then there is probably something wrong with you... \n ')
end