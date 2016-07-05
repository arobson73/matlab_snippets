function y = surface_sphere(c)
%surface of a spherical plant
%you just discovered its circumference, that is the input.

%circumference = 2 * pi * r = pi * d; 
%surface = 4 * pi * r^2

%(c/(2*pi)) ^2 * 4 * pi = s

y = (c^2)/pi;
