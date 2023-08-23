function [peak_indxs_max,peak_indxs_min] = find_peak_indxs(K)
peak_indxs_max = zeros(length(K),1);
peak_indxs_min = zeros(length(K),1);
for i=1:size(K,2)
    tl = K(:,i);
    if abs(max(tl))>abs(min(tl))
        [~,peak_indxs_max(i,1)] = max(tl);
%         peak_indxs_min(i,1) = 0;
    end
    if abs(max(tl))<abs(min(tl))
        [~,peak_indxs_min(i,1)] = min(tl);
%         peak_indxs_max(i,1) = 0;             
    end
end  
end