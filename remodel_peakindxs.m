function [peak_indxs] = remodel_peakindxs(peak_indxs,locs,Des)
for i=1:length(peak_indxs)
    if peak_indxs(i)~=0
        if sum(Des(peak_indxs(i),:))==0
            temp = locs(peak_indxs(i),:);
            temp(temp==0) = [];
            for j=1:length(temp)
                if sum(Des(temp(j),:))==0
                    peak_indxs(i) = temp(j);
                end
            end
        end
    end
end
end
