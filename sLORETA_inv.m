function [J_sLORETA] = sLORETA_inv(KK,phi,alpha)
[Nchan, ~] = size(KK);

H = eye(Nchan,Nchan) - ones(Nchan,1)*ones(1, Nchan)/(ones(1, Nchan)*ones(Nchan,1));
phi = H*phi;
KK = H*KK;
% pre = 0;
% alpha = 100;
% if pre==0
    if isempty(alpha)
        [U,s,~] = csvd(KK);
        [reg_corner,~,~,~] = l_curve(U,s,phi,'Tikh');
        alpha = reg_corner;
        close
    end
    T_sLORETA = KK'*pinv(KK*KK'+alpha*H);
% else
%     if size(K,2)>21000
%         load('C:\Users\DELL\Documents\MATLAB\T_sLORETA_IITKGP2AIIMS','T_sLORETA');
%     else
%         load('C:\Users\DELL\Documents\MATLAB\T_sLORETA_IITKGP.mat','T_sLORETA');
%     end
% end

J_sLORETA = T_sLORETA*phi;
end

