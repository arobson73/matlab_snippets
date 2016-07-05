function y = back_forth(x)
%produces a matrix with numbers winding back and forth up to n^2
y1 = 1:x^2;
y = reshape(y1,x,x)';

y(2:2:end,:) = flip(y(2:2:end,:),2);

