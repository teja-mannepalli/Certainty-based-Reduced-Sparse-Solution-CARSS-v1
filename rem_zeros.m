function [data] = rem_zeros(data)

l = 1;temp = zeros(sum(data~=0),1);
for i=1:length(data)
    if data(i,1)~=0
        temp(l,1) = data(i,1);
        l = l+1;
    end
    
end
data = temp;
end