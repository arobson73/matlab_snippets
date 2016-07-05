function y = sum_diag2(x)

%Find the sum of the elements in the diagonal that starts at the top-right corner and ends at the bottom-left corner.

y = sum(diag(flip(x)));
