function [locs,peak_indxs_max,peak_indxs_min,Ds,Delec] = Stage_0(varargin)
K = varargin{1};
elecpos = varargin{2};
dipos = varargin{3};
r = varargin{4};
if nargin > 4
    Ds = varargin{5};
end
[Delec] = find_delec(elecpos,r);

if length(Delec)==256
    th = 1.05;
else
    th = 1.2;
end
[locs] = find_elec(Delec,th*Delec(1,2));

[peak_indxs_max,peak_indxs_min] = find_peak_indxs(K);

if nargin==4
    Ds = zeros(length(dipos),length(dipos));
    for i=1:length(dipos)
        if rem(i,100)==0
            fprintf('grid = %d out of %d',i,length(dipos));
            fprintf('\n');
        end
        for j=1:length(dipos)
            if i~=j && j>i
                Ds(i,j) = sqrt ( sum(  (dipos(i,:)-dipos(j,:)).^2  ) );
            else
                Ds(i,j) = Ds(j,i);
            end
        end
    end
end
% Dng = find_neighbour_zones(Ds);
end