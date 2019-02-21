%% Sine sum function
% Creates Sn vector
function Sn=sinesum(t,b)
for jj=1:1:length(t)
    Sn(jj,1)=0;
    for ii=1:1:length(b)
        Sn(jj,1)=Sn(jj,1)+b(ii,1)*sin(ii*t(jj,1));
    end
end


        
    
