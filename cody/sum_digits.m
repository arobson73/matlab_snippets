function y = sum_digits(x)
t = 2^x;
s = num2str(t);
y = 0;
for i = 1: length(s)
    y = y + str2num(s(i));
end

