function [Des] = find_Des(pks,locs)
Des = zeros(size(locs,1),20);
for i=1:size(locs,1)
    l = 1;
    for j=1:size(pks,1)
        if i==pks(j,1)
            Des(i,l) = j;
            l = l+1;
        end
    end
end
end