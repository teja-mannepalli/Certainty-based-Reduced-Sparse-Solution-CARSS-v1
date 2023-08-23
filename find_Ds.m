function [Ds] = find_Ds(grid)
Ds = zeros(size(grid.dipos,1),size(grid.dipos,1));
for i=1:size(grid.dipos,1)
    for j=1:size(grid.dipos,1)    
        Ds(i,j) = norm(grid.dipos(i,:)-grid.dipos(j,:));
    end
end

end