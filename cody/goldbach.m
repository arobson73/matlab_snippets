function y = goldbach(n)
%%Given the even integer n, return primes p1 and p2 that satisfy the condition n = p1 + p2. Note that the primes are not always unique. The test is not sensitive to order or uniqueness. You just need to meet the appropriate conditions.

%Example:
% Input  n = 286
% Output (any of the following is acceptable) 
%        [  3 283]
%        [283   3]
%        [  5 281]
%        [107 179]
%        [137 149]
%    end
p = primes(n-1);
ix = 1:length(p);
[i,j] = meshgrid(ix,ix);
im = unique(sort([i(:) j(:)],2),'rows'); %index matrix
y=[];
for w = 1: length(im)
    i1 = im(w,1);
    i2 = im(w,2);
    res = p(i1) + p(i2);
    if(res == n)
       y = [y;[p(i1) p(i2)]]; 
    end
end
y = y(1,:);
