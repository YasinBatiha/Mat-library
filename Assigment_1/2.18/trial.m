%% This function enable to interactively input b coefficients 
function b=trial(N)
for ii=1:1:N
    b(ii,1)=input(['Enter coeficient b' num2str(ii) ': \n ']);
end
end

