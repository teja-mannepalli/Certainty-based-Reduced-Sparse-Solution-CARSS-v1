function [certain] = certainty(locs,peak_phi,K,phi,p_sources)
certain = zeros(size(p_sources));
for i=1:length(peak_phi)
    l1 = locs( peak_phi(i,1),:);
    phi_local = phi( l1(l1~=0)); 
    j = i;
%     for j=1:size(pos_sources,1)
        for k = 1:size(p_sources,2)
            if p_sources(j,k)~=0
                K_local = K(l1(l1~=0),p_sources(j,k));
%                 K_local = K(locs(locs(peak_phi(i,1),:)~=0,:),p_sources(j,k));
                b = 1;scale = norm(phi_local)/norm(K_local);
                cert = sum(  1 ./exp( (1/b)*(  scale*abs(K_local) - abs(phi_local)  ...
                    )./abs(phi_local) ).^2  )/numel(K_local);
                certain(j,k) = cert;
%                 cert = sum( diag(pdist2(scale*abs(K_local), abs(phi_local))) );
%                 certain(j,k) = 1 - cert;
                
            end
        end
        
%     end
end
   
% certain = normalize(certain,2,'range');
% % % % for i = 1:size(certain,1)
% % % %     normA = certain(i,:) - min(certain(i,:));
% % % %         normA = normA ./ max(normA(:));  
% % % %         certain(i,:) = normA;
% % % %     for j=1:size(certain,2)
% % % %         if p_sources(i,j)~=0 && certain(i,j)==0
% % % %             certain(i,j) = 10e-4;
% % % %         end
% % % %     end
% % % % end
    



% % % certain_base = zeros(size(peak_max_phi));
% % K_local = zeros(length(peak_max_phi),sum(sum(locs(peak_max_phi,:)~=0)~=0));
% % phi_local = K_local;
% % for i=1:length(peak_max_phi)
% %     K_local(i,1:sum(locs(peak_max_phi(i),:)~=0)) = K(locs(peak_max_phi(i,1),1),locs(peak_max_phi(i),:)~=0);
% %     phi_local(i,1:sum(locs(peak_max_phi(i),:)~=0)) = phi(locs(peak_max_phi(i,1),:)~=0)';
% % % % % % % % %     PREVIOUSLY COMMENTED
% %     scale = norm(phi_local)/norm(K_local);
% % %     phi_local = phi_local/scale;
% % % % % % %     
% %     if (sum(phi_local(i,:) + K_local(i,:))/2)~=0
% % %         sk = (sum(phi_local(i,:) + K_local(i,:))/2);
% %         b = 1;
% % %         cert = sum(phi_local(i,:) - K_local(i,:))/sk;
% %         p2 = scale* abs(K_local(i,:) ) - abs(phi_local(i,:)) ;
% %         p1 = exp(  p2./abs(phi_local(i,:))  ).^2;
% % %         cert = p1;
% % %         cert = (1/b) * (max(p1) - p1 );
% %         cert = (1/b) * (1 ./ p1 );
% % %         cert = norm([scale*K_local - phi_local]./phi_local);
% % %         if cert~=0
% % %             disp(cert(cert~=0));
% % %         end
% %     else
% %         cert = 1;
% %     end
% %     if isnan(cert)
% %         cert = 0;
% %     end
% % %     certain_base(i,:) = 100 - abs(cert);
% % %     certain_base(i,:) = abs(cert);
% % end
% % certain_base = abs(cert);
% % certain = zeros(size(pos_sources));
% % for i=1:size(pos_sources,1)
% %     for j = 1:size(pos_sources,2)
% %         if pos_sources(i,j)~=0
% %             certain(i,j) = certain_base(i,1);
% %         end
% %     end
% % end
% % certain = cert;
% % % temp = normalize(certain,'range');
% % % disp(temp(temp~=0));
% % % certain = normalize(certain,'range');

end