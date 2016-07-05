function y = rem_nan(x)

y = x;
[i,j] = find(isnan(x)==1);
while length(i) > 0
    y(i(1),:) = [];
    [i,j] = find(isnan(y)==1);
end


