function y = sorted_high_to_low(x)
%Return 1 if the input is sorted from highest to lowest, 0 if not.
%Example:
% 1:7     -> 0
% [7 5 2] -> 1
x = x(:)'; %put in row order
xd = sort(x,2,'descend');
if isequal(x,xd)
    y = 1;
else
    y = 0;
end

