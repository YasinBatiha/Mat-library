close all
clc
% Crankshaft mechanism
% given parameters
a=0.1;  
b=0.2;
t=(linspace(0,8,100))';    % time vector
omega=1;    % angluar velocity
phi=pi/6+omega.*t;    % vector of angle phi
x0=[0.5;0.5];  % initial guess
tol=1e-6;   % tolerance
% initialize the position, velocity and acceleration vectors
x=zeros(length(t),2);
v=zeros(length(t),2);
ac=zeros(length(t),2);
% Jacobian
J=@(u) [-b*sin(u(1)),-1;-b*cos(u(1)),0];    
for ii=1:length(t)
    % Position
    F=@(u)[a*cos(phi(ii))+b*cos(u(1))-u(2);a*sin(phi(ii))-b*sin(u(1))];
    [x(ii,:),~] = NR_method(F, J, x0, tol);
    % Velocity
    Fv=@(u)[-a*omega*sin(phi(ii))-b*sin(x(ii,1))*u(1)-u(2);a*omega*cos(phi(ii))-b*cos(x(ii,1))*u(1)];
    [v(ii,:),~] = NR_method(Fv, J, x0, tol);
    % Acceleration
    Fa=@(u)[-a*omega^2*cos(phi(ii))-b*cos(x(ii,1))*(v(ii,1))^2-b*sin(x(ii,1))*u(1)-u(2);-a*omega^2*sin(phi(ii))+b*sin(x(ii,1))*(v(ii,1))^2-b*cos(x(ii,1))*u(1)];
    [ac(ii,:),~] = NR_method(Fa, J, x0, tol);
end
% Plotting results
subplot(2,1,1)
plot(t,x(:,2),'k')
hold on
plot(t,v(:,2),'b')
plot(t,ac(:,2),'r')
fplot(0,[0,t(ii)],'--k')
legend('x(t)','v(t)','a(t)')
title('Piston kinematics')
xlabel('time [s]')
ylabel('[m], [m\cdots^{-1}], [m\cdots^{-2}]')

subplot(2,1,2)
plot(t,x(:,1),'k')
hold on
plot(t,v(:,1),'b')
plot(t,ac(:,1),'r')
fplot(0,[0,t(ii)],'--k')
hl = legend('$\theta$','$\dot{\theta}$','$\ddot{\theta}$');
set(hl, 'Interpreter', 'latex');
title('Rotation of the piston rod')
xlabel('time [s]')
ylabel('[rad], [rad\cdots^{-1}], [rad\cdots^{-2}]')