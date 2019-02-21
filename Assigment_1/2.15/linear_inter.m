function linear_inter(y)
t=0:1:(length(y)-1);    % time vector
N=length(y)-1;  % right border of the interval
time=1; % initial value of the time for interpolation
% loop asking for time and returning interpolated value
while time>=0
    time=input(['Input the time in [s] on interval (0,' num2str(N) '): \n '])
    if time<=0
        break
    elseif time>=N
        break
    end
    close all
    yint=lin_int(y,time);   
    plot(t,y)   % plotting of the interpolated values with the actual values
    hold on
    scatter(time,yint)
end
fprintf('Invalid time. \n ')