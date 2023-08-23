function [locs] = find_loc(Delec,elec,th)
IndD = zeros(size(Delec));
P = IndD;
for i=1:size(elec.chanpos,1)
    [P(i,:),IndD(i,:)] = sort(Delec(i,:),'ascend');
end
% InD = IndD(:,2:40);
% locs = InD;
locs = zeros(size(Delec,1),120);
% Pd = P(:,2:41);
for i=1:256
    c = P(i,:);
    for j=1:23
        if((P(i,j))<th) %)...Pd(i,j+1)-Pd(i,j)>8 && 23.2 our values 1:15,2:16,33
            locs(i,j)=IndD(i,j);
        else
            locs(i,j)=0;
        end
    end
end
locs( :, ~any(locs,1) ) = []; 
% locs = InD;
end