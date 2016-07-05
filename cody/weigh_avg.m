function y = weigh_avg(a,b)
%compute weighted avg
y = sum(a .* b) / length(a);
