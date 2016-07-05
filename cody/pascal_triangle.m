function y = pascal_triangle(n)

%Given an integer n >= 0, generate the length n+1 row vector representing the n-th row of Pascal's Triangle.

%Examples:
% pascalTri(0)
% ans =
%     1
% pascalTri(1)
% ans =
%     1     1
% pascalTri(2)
% ans =
%     1     2     1
n=n+1;
if n == 1
    y = 1;
    return;
elseif n==2
    y = [1 1];
    return;
elseif n==3
    y = [1 2 1];
    return
end
y= [1 2 1]; 
yn = [];
for i=4:n
    %get new index set   
    ix = [1 1:(i-1);1 2:(i-1) (i-1)];
    for j=1:i
        index = ix(:,j);
        yn = [yn sum(y(index(1):index(2)))];
    end
    y = yn;
    yn=[];
end
