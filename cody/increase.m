function y = increase(m)
%determine whether vector is montonically increasing
d = diff(m);
a = find(d <= 0);
if (length(a) > 0)
    y = 0;
else
    y = 1;
end
