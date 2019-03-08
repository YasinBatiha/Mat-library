function [t1,y] = Euler_ODE(y0,ydot,dt,tn)
n=floor(tn/dt);
y=zeros(n+1,1);
t1 = (linspace(0, n*dt, length(y)))';
y(1)=y0;
for ii=1:n
    y(ii+1)=y(ii)+dt*ydot(t1(ii), y(ii));
end

    