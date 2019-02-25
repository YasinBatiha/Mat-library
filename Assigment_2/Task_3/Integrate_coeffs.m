function b = integrate_coeffs(f,N,M)
% Intergrate coeffs
for ii=1:N
b(ii,1)=1/pi*Int_trapziodal_fc(f,-pi,pi,M,ii);
end

end