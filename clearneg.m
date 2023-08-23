function [J] = clearneg(J)
J(J<0) = 0;

end