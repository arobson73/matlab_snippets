function y = most_zeros(x)
%compute row with most non zeros
[i,y] = max(sum(x~=0,2));


