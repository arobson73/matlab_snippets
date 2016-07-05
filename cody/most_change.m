function y = most_change(x)
%each row represent a person and each columns represents quarters, nickels, dimes, pennnis
%0.25,0.1,0.05,0.01
mon = [0.25 0.05 0.1 0.01]';
%x*mon
[i,y] = max(x*mon);

