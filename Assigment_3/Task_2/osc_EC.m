clc
close all

omega = 2;  % Natural frequncy omegra = sqrt(k/m)
P = 2*pi/omega; % Period
dt = P/60;  % time step
T = 3*P;    % time interval t = (0, T)
N_t = floor(T/dt);  % number of elements
t = linspace(0, N_t*dt, N_t+1); % time vector
u = zeros(N_t+1, 1);    % displacment vector
v = zeros(N_t+1, 1);  % speed vector

% Initial conditions
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time - Euler - Crommer scheme
for n = 1:N_t
    v(n+1) = v(n) - dt*omega^2*u(n);
    u(n+1) = u(n) + dt*v(n+1);
end

% % Ploting Euler - Crommer scheme performance
% plot(t, u, 'b-', t, X_0*cos(omega*t), 'r--');
% legend('numerical', 'exact','location','northwest');
% xlabel('t');

[ec, ep] = osc_energy(u, v, omega); % Calling function that compute potencial and kinetic energy
E=ec+ep;
% Plotting the results
plot(t,E)
hold on
plot(t,ec)
plot(t,ep)
xlabel('t [s]')
ylabel('E [J]')
title('Euler - Cromer')
legend('E','ec','ep')
