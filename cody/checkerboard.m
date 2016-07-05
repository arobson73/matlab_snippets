function y = checkerboard(n)
if n ==1
    y=1;
    return; 
end
a = mod(1:n,2);
b= ~a;

for i=1:n
    if (mod(i,2))
        y(i,:) = a;
    else
        y(i,:) = b;
    end
end

