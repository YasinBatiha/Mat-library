function yint=lin_int(y,time)
t=0:1:(length(y)-1);    % time vector
% loop for choosing the the interval where the time is to be interpolated
for test=t
    if time<test
        s=test;
        break
    end
end
% for ii=1:1:(length(t)-1)
%     ai(1,ii)=(y(1,ii+1)-y(1,ii))/(t(1,ii+1)-t(1,ii));
%     bi(1,ii)=(y(1,ii)*t(1,ii+1)-y(1,ii+1)*t(1,ii))/(t(1,ii+1)-t(1,ii));
% end
% calculation of the interpolated value
 ai=(y(1,s+1)-y(1,s))/(t(1,s+1)-t(1,s));
 bi=(y(1,s)*t(1,s+1)-y(1,s+1)*t(1,s))/(t(1,s+1)-t(1,s));
yint=ai*time+bi;
fprintf('The interpolated value is y=%.2f. \n',yint)