function [n1] = adaptive_integration(f,a,b,eps,method)
c=1;    % index counter
diff=1; % initial value of difference
n(c)=1; % initial number of elements
% deciding which method
if method
    int(c)=midpoint_vec(f,a,b,n);
    while eps < diff
        c=c+1; 
        n(c)=n(c-1)*2; % multiplied number of elements
        int(c)=midpoint_vec(f,a,b,n(c));    % integration
        diff(c)=abs(int(c)-int(c-1));   % calculating error
        n1=n(c);
    end
else
    int(c)=Int_trapziodal(f,a,b,n);
    while eps < diff
        c=c+1;
        n(c)=n(c-1)*2;
        int(c)=Int_trapziodal(f,a,b,n(c));
        diff(c)=abs(int(c)-int(c-1));
        n1=n(c);
    end
end
% plotting results
semilogy(n,diff)
ylim([eps,1e-1])
title('convergence')
ylabel('\epsilon - error')
xlabel('n - number of elements')
end

