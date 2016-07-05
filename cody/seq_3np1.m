function y = seq_3np1(n)
%creates the 3n +1 if odd or n/2 if even, sequence always ends with 1
y=[n];
i=1;
while y(i) ~= 1
    if mod(y(i),2)
        y(i+1) = 3*y(i)+1;
    else
        y(i+1) = y(i)/2;
    end
   i = i + 1; 
end
