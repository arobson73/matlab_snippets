function y = right_triangle(x)

%Given a vector of lengths [a b c], determines whether a triangle with those sides lengths is a right triangle: http://en.wikipedia.org/wiki/Right_triangle.

%Examples:

%[3 4 5] ---> true

%[5 12 13] ---> true

%[5 5 5] ---> false

s = sort(x,2,'descend');
m = s(1);
if m == (sqrt(s(2)^2 + s(3)^2))
    y = 1;
else
    y = 0;
end



