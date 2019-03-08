function [ec, ep] = osc_energy(u, v, omega)

ec=zeros(length(v),1);
ep=zeros(length(v),1);

for ii=1:length(u)
    ec(ii)=0.5*(v(ii))^2;
    ep(ii)=0.5*omega^2*(u(ii))^2;
end
end
