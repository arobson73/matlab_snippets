function y = too_mean_spirited(x)

%Find the mean of each consecutive pair of numbers in the input row vector. For example,

%x=[1 2 3] ----> y = [1.5 2.5]

%x=[100 0 0 0 100] ----> y = [50 0 0 50]
ix = [1:length(x)-1;2:length(x)];


y = sum(x(ix(:,1:length(ix))))/2;
