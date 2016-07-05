function [i,j] = nearest_nums(x)

%Given a row vector of numbers, find the indices of the two nearest numbers.

%Examples:
% [index1 index2] = nearestNumbers([2 5 3 10 0 -3.1])
% index1 =
%      1
% index2 =
%      3
% [index1 index2] = nearestNumbers([-40 14 22 17])
% index1 =
%      2
% index2 =
%      4

%Notes
%1.The indices should be returned in order such that index2 > index1.
%2.There will always be a unique solution.
r=[];
for i=1:length(x)
    t = abs(x - x(i));
    t(i)=[];
%    r(i,:)=t;
    m(i) = min(t); 
end

a = find(m==min(m));
i=a(1);j=a(2);
