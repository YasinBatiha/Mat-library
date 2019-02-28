function [n] = adaptive_integration(f,a,b,eps,method)
c=1;
diff=1;
n(c)=1;
if method
    int(c)=midpoint_vec(f,a,b,n);
    while eps < diff
        c=c+1;
        n(c)=n(c-1)*2;
        int(c)=midpoint_vec(f,a,b,n(c));
        diff(c)=abs(int(c)-int(c-1));
    end
else
    int(c)=Int_trapziodal(f,a,b,n);
    while eps < diff
        c=c+1;
        n(c)=n(c-1)*2;
        int(c)=Int_trapziodal(f,a,b,n(c));
        diff(c)=abs(int(c)-int(c-1));
    end
end
semilogy(n,diff)
ylim([eps,1e-1])
title('convergence')
ylabel('\epsilon - error')
xlabel('n - number of elements')
end

