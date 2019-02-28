function b = Integrate_coeffs(f,N,M)
% Intergrate coeffs one by one
for ii=1:N
b(ii,1)=1/pi*Int_trapziodal_fc(f,-pi,pi,M,ii);
end
end