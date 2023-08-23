function [peak_max_phi,peak_min_phi] = find_peaks_phi(phi,locs)
phi_locs = locs;
for i=1:size(locs,1)
    for j=1:size(locs,2)
        if locs(i,j)~=0
            phi_locs(i,j) = phi(locs(i,j),1);
        end
    end
end
l = 1;ll=1;
peak_min_phi = zeros(256,1);
peak_min_amp = zeros(256,1);
peak_max_amp = zeros(256,1);
peak_max_phi = zeros(256,1);

th = 0.3;
th_min = th*min((phi));
th_max = th*max((phi));

for i=1:size(locs,1)
    if abs(max(phi_locs(i,:)))==abs(phi_locs(i,1))         
        if abs(phi_locs(i,1)) > th_max
            peak_max_phi(l,1) = i;
            peak_max_amp(l,1) = abs(phi_locs(i,1));
            l = l+1;
        end
    end
    if abs(min(phi_locs(i,:)))==abs(phi_locs(i,1))          
        if (phi_locs(i,1)) < (th_min)
%             abs(phi_locs(i,1)) > abs(th_min)
            peak_min_phi(ll,1) = i;
            peak_min_amp(ll,1) = abs(phi_locs(i,1));
            ll=ll+1;
        end
    end
end
peak_min_phi(peak_min_phi==0) = [];
peak_max_phi(peak_max_phi==0) = [];

if isempty(peak_min_phi)
    peak_min_phi = [0];
end
if isempty(peak_max_phi)
    peak_max_phi = [0];
end

% disp(size(peak_max_phi))
end