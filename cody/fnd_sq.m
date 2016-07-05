function y = fnd_sq(a)
% return true if one of the numbers is a square of one
% of the other numbers
r = find(ismember(a.^2,a)==1);
if length(r) > 0
    y=1;
else
    y=0;
end
