function y = is_right_angle_triangle(a,b,c)
%Given three positive numbers a, b, c, where c is the largest number, return true if the triangle with sides a, b and c is right-angled. Otherwise, return false.

%c^2 = b^2 + a^2

c2 = c^2;
b2 = b^2;
a2 = a^2;

if(c2 == (b2+a2))
    y =1;
else
    y=0;
end
