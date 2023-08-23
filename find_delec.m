function [Delec] = find_delec(elec,r)
Delec = zeros(length(elec),length(elec));
for i=1:length(elec)
    for j=1:length(elec)
        if i~=j
            neleci = sqrt(sum(elec(i,:).^2));
            nelecj = sqrt(sum(elec(j,:).^2));
            cr = neleci*nelecj*sin(neleci/nelecj);
            do = sum(conj(elec(i,:)').*elec(j,:)');
%             Delec(i,j) = atan2(abs(cr),abs(do));
            Delec(i,j) = r * atan2(norm(cross(elec(i,:),elec(j,:))),dot(elec(i,:),elec(j,:)));
%             Delec(i,j) = Delec(i,j)*r;
        end
    end
end

end
