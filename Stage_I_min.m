function [J_priorm,pos_sourcesm] = Stage_I_min(peak_min_phi,locs,Desm,K,phi,gd,Ds)

if sum(peak_min_phi)~=0
    if sum(sum(Desm(peak_min_phi,:)))~=0
        pos_sourcesm = Desm(peak_min_phi,:);
    else
        pos_sourcesm = [0];
    end
else
    pos_sourcesm = [0];
end 

[Ct] = certainty(locs,peak_min_phi,K,phi,pos_sourcesm);
tce = 0;tf = 30;m = 1;
[Dss,IndDs] = sort(Ds,1,'ascend');

for i=1:size(pos_sourcesm,1)
    for j=1:size(pos_sourcesm,2)
        if pos_sourcesm(i,j)~=0
        if((Ct(i,j)>=tce))
            l=1;ll = 1;
            c = pos_sourcesm(i,j);
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
if sum(sum(Desm(peak_min_phi,:)))>0

    for i=1:size(sec,1)  
        for j=1:size(sec,2)
            if sec(i,j)~=0
                if J(sec(i,j),1) < certain(i,j)
                    J(sec(i,j),1) = certain(i,j);
                end
            end
        end
    end
    
    
    for i=1:size(pos_sourcesm,1)  
        for j=1:size(pos_sourcesm,2)
            if pos_sourcesm(i,j)~=0
                if J(pos_sourcesm(i,j),1) < Ct(i,j)
                    J(pos_sourcesm(i,j),1) = Ct(i,j);
                end
            end
        end
    end

end
end
J_priorm = J;

















% Cp1 = zeros(size(Ct));
% for i=1:size(Ct,1)
%     Cp1(i,:) = (Ct(i,:)./max(Ct(i,:)));
% end
% Cp1(isnan(Cp1)) = 0;
% 
% tf=15;
% [Dss,IndDs] = sort(Ds,1,'ascend');
% if tf>size(Dss,1)
%     tf = size(Dss,1)-1;
% end
% m=1;
% Cpp1 = [0];
% sec = [0];
% for i=1:size(pos_sourcesm,1)
%     for j=1:size(pos_sourcesm,2)
%         if((Cp1(i,j)>=0.1) && pos_sourcesm(i,j)~=0)
%             l=1;ll = 1;
%             c=ceil((pos_sourcesm(i,j)));
%             if size(K,2)>size(Ds,1)
%                 d = Dss(2:tf,ceil(c/3));
%                 cc = IndDs(2:tf,ceil(c/3));
%             else
%                 d = Dss(2:tf,c);
%                 cc = IndDs(2:tf,c);
%             end
%             for k=1:length(d)
%                 if(d(k,1)<=gd+0.1)
%                     if size(K,2)>size(Ds,1)
%                         sec(m,ll) = 3*cc(k,1);
%                         sec(m,ll + 1) = 3*cc(k,1) - 1;
%                         sec(m,ll + 2) = 3*cc(k,1) - 2;
%                         Cpp1(m,ll) = Cp1(i,j);
%                         Cpp1(m,ll+1) = Cp1(i,j);
%                         Cpp1(m,ll+2) = Cp1(i,j);
%                         l=l+1;ll = ll+ 3;
%                     else
%                         sec(m,l) = cc(k,1);
%                         Cpp1(m,l) = Cp1(i,j); 
%                         l=l+1;
%                     end
%                 end
%             end
%             m=m+1;
%         end
%     end
% end
% 
% J = zeros(size(K,2),1);
% 
% % for  i=1:size(K,2)
% %     for j=1:size(pos_sourcesm,1)
% %         for k=1:size(pos_sourcesm,2)  
% %             if(i==pos_sourcesm(j,k))
% %                 J(i,1) = Cp1(j,k); 
% %             end
% %         end
% %     end
% % end
% J(pos_sourcesm(pos_sourcesm~=0)) = (Cp1(Cp1~=0));
% J(sec(sec~=0)) = (Cpp1(Cpp1~=0));
% 
% % for i=1:size(K,2)    
% %     for j=1:size(sec,1) 
% %         for k=1:size(sec,2)
% %             if(i==sec(j,k))
% %                 if(ismember(i,pos_sourcesm))
% %                     J(i,1) = Cpp1(j,ceil(k/3));
% %                 else
% %                     J(i,1) = Cpp1(j,ceil(k/3));
% %                 end
% %             end
% %         end
% %     end
% % end
% 
% J_priorm = J;

end
