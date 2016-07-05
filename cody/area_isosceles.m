function A = area_isosceles(x,y)
%An isosceles triangle has equal sides of length x and a base of length y. Find the area, A, of the triangle.

A = (y/4) * sqrt(4*(x^2) - (y^2));
