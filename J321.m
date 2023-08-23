function [J] = J321(Jp)
J = zeros(ceil(size(Jp,1)/3),1);
l=1;
for i=1:size(Jp,1)/3
    J(i,1) = sqrt(Jp(l,1).^2+Jp(l+1,1).^2+Jp(l+2,1).^2);
    l=l+3;
end