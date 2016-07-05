function y = large_num_next2_zero(m)

%%This example comes from Steve Eddins' blog: Learning Lessons from a One-Liner

%%Write a function that takes a list or array of numbers as input and return the largest number that is adjacent to a zero.

%%Example:
% Input  x = [1 5 3 0 2 7 0 8 9 1 0]
% Output y is 8
e = eye(length(m));
mask = e(1:length(m)-1,:) + e(2:length(m),:);
%t = mask * m';
c=[];
for i = 1:size(mask,1)
    t = mask(i,:) .* m;
    if( sum(t==0) == length(m)-1)
        c(i) = sum(t);
        c
    end
end 
d = c((find(c~=0)));
y =max(d) ;
