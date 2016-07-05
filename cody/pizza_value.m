function y= pizza_value(cost,d)
%%Pizza prices are typically listed by diameter, rather than the more relevant feature of area. Compute a pizza's value (cost per unit area) given the diameter and cost. Use parentheses to make the order of operations clear; do not rely on operator precedence. Area of a circle is pi * radius * radius.

area = pi * ((d/2)^2)

cost_per_area = cost / area;
y = cost_per_area;
