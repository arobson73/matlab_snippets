function y = fib(n)
%get the nth fibonacii value
y = [1 1 zeros(1,n-2)];
for i = 3:n
    y(i) = y(i-1)+y(i-2);  
end
y
y= y(end);


