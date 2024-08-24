function [J_prior,pos_sources] = Stage_I_max(peak_max_phi,locs,Des,K,phi,gd,Ds)
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

if sum(peak_max_phi)~=0
    pos_sources = Des(peak_max_phi,:);
else
    pos_sources = [0];
end
[Ct] = certainty(locs,peak_max_phi,K,phi,pos_sources);
tce = 0;tf = 30;m = 1;
[Dss,IndDs] = sort(Ds,1,'ascend');

for i=1:size(pos_sources,1)
    for j=1:size(pos_sources,2)
        if pos_sources(i,j)~=0
        if((Ct(i,j)>=tce))
            l=1;ll = 1;
            c = pos_sources(i,j);
            if size(K,2)>size(Ds,1)
                d = Dss(2:tf,ceil(c/3));
                cc = IndDs(2:tf,ceil(c/3));
            else
                d = Dss(2:tf,c);
                cc = IndDs(2:tf,c);
            end
            for k=1:length(d)
                if(d(k,1)<=gd)
                if size(K,2)>size(Ds,1)
                    sec(m,ll) = 3*cc(k,1);sec(m,ll+1) = 3*cc(k,1) - 1;
                    sec(m,ll+2) = 3*cc(k,1) - 2;
                    certain(m,ll) = Ct(i,j);certain(m,ll+1) = Ct(i,j);
                    certain(m,ll+2) = Ct(i,j);
                    l=l+1;ll = ll + 3;
                else
                    sec(m,ll) = cc(k,1);
                    certain(m,l) = Ct(i,j);
                    ll = ll + 1;l = l + 1;
                end
                end
            end
            m=m+1;
        end
        end
    end
end

J = zeros(size(K,2),1);
if exist('sec','var')
if sum(sum(Des(peak_max_phi,:)))>0
%     J(sec(sec~=0)) = (certain(certain~=0));
%     J(pos_sources(pos_sources~=0)) = (Ct(Ct~=0));
    for i=1:size(sec,1)  
        for j=1:size(sec,2)
            if sec(i,j)~=0
                if J(sec(i,j),1) < certain(i,j)
                    J(sec(i,j),1) = certain(i,j);
                end
            end
        end
    end
    
    
    for i=1:size(pos_sources,1)  
        for j=1:size(pos_sources,2)
            if pos_sources(i,j)~=0
                if J(pos_sources(i,j),1) < Ct(i,j)
                    J(pos_sources(i,j),1) = Ct(i,j);
                end
            end
        end
    end

end
end
J_prior = J;


% 
% J(sec(sec~=0)) = (Cpp1(Cpp1~=0));
% 
% J_prior = J;
end
