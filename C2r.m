function [J] = C2r(J_any,J_CARSS)
M = size(J_CARSS,1);
J = zeros(M,1);l=1;
for i=1:M
    if J_CARSS(i,1)~=0
        J(i,1) = J_any(l,1);l=l+1;
    end
end
end