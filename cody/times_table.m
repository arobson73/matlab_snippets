function y = times_table(n)
%create times table
a = repmat(1:n,n,1);
b = repmat([1:n]',1,n);
y = a.*b;
