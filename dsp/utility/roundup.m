function y = roundup(num, multiple)
%this will round up the num so that
% it becomes a multiple of multiple
if multiple == 0
    y = num;
    return
end
r = mod(abs(num),multiple);
if r == 0
    y = num;
    return
end

if num < 0
    y = -(abs(num) - r);
else
    y =  num + multiple -r;
end
