clc
close all
for ii = 1:2
    dt = P/(20*100^(ii-1)); % time step
omega = 2;  % natural frequenc  
P = 2*pi/omega; % Period
T = 3*P;    % time inerval
N_t = floor(T/dt);  % number of nodes
t = linspace(0, N_t*dt, N_t+1); % time vector

u = zeros(N_t+1, 1);    % postions vector
v = zeros(N_t+1, 1);    % speed vector

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time for Euler - Backward scheme
for n = 1:N_t
    u(n+1) = (u(n) + dt*v(n))/(1+dt^2*omega^2);
    v(n+1) = v(n) - dt*omega^2*u(n+1);
end
% Plotting this method performance
subplot(1,2,ii)
plot(t, u, 'b-', t, X_0*cos(omega*t), 'r--');
legend('numerical', 'exact', 'Location','northwest');
title(['EB, steps/period = ', num2str(N_t/3) ,''])
xlabel('t [s]');
ylabel('u [m]')
end
