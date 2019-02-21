%% Test sine sum
% This function test function of sinesum in compare with hand calculation
function test_sinesum()
t=[-pi/2;pi/4];
b=[4;-3];
Sntest(1,1)=b(1,1)*sin(t(1,1))+b(2,1)*sin(2*t(1,1));
Sntest(2,1)=b(1,1)*sin(t(2,1))+b(2,1)*sin(2*t(2,1));
Sn=sinesum(t,b)
end
