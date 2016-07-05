function y = trim_space(x)
%Given a string, remove all leading and trailing spaces (where space is defined as ASCII 32).
% Input  a = ' singular value decomposition  '
% Output b is 'singular value decomposition'
asc = double(x);
spaces = asc==32;
i=1;
counts=0;
while spaces(i) ==1
    counts = counts +1;
    i = i +1;
end
%counts
last = length(x);
counte=0;
while spaces(last) == 1
    counte = counte + 1;
    last = last -1;
end
%counte
y = x(counts+1:end-counte);
