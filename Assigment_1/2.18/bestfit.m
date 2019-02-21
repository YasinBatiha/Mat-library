% This function finds best coefficient combination for 
function [b]=bestfit(f,M)
s=(-1:0.1:1)';
Buffer=zeros((length(s))^3,4);
counter=0;
for ii=1:1:length(s)
    b1=s(ii,1);
    for jj=1:1:length(s)
        b2=s(jj,1);
        for kk=1:1:length(s)
            b3=s(kk,1);
            b=[b1;b2;b3];
            E=error_s(b,f,M);
            counter=counter+1;
            Buffer(counter,1)=E;
            Buffer(counter,2)=b1;
            Buffer(counter,3)=b2;
            Buffer(counter,4)=b3;
        end
    end
end
% Finding minimum error coefficients and printing its values.
[v,i] = min(Buffer(:,1));
fprintf('Minimum error is E = %.2f and corresponding coeficients are: \n ', v)
fprintf('b1 = %.2f  \n ', Buffer(i,2))
fprintf('b2 = %.2f  \n ', Buffer(i,3))
fprintf('b3 = %.2f  \n ', Buffer(i,4))
% Writing the best coefficients to vector b
B=Buffer(i,:);
b(1,1)=B(1,2);
b(2,1)=B(1,3);
b(3,1)=B(1,4);
% Getting values for plotting the approximated and exact values of function
t1=(-pi:2*pi/M:pi)';
f=f(t1);
Sn=sinesum(t1,b);
% Plotting the results
figure
plot(t1,f,'b')
hold on
plot(t1,Sn,'r')
legend('exact','sines')
title('Bestfit approximation')
end
