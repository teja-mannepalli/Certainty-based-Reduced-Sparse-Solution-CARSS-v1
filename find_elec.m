function [locs] = find_elec(Delec,gd)

[P,IndD] = sort(Delec,2,'ascend');
aa = 20;
InD = zeros(length(Delec),aa);
for i=1:length(Delec)
    l=1;
    for j=1:length(Delec)
        if((P(i,j))<=gd) 
            InD(i,l)=IndD(i,j);l=l+1;
        end
    end
end
l = 1;
locs = zeros(length(Delec),aa);
for i=1:aa
    if sum(InD(:,i))~=0
        locs(:,l) = InD(:,i);
        l = l +1;
    end
end
temp = zeros(length(locs),sum(sum(locs,1)~=0));
l = 1;
for i=1:aa
    if sum(locs(:,i))~=0
        temp(:,l) = locs(:,i);
        l = l+1;
    end
end
locs = temp;
end