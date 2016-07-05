function y = findPos(x,p)

%%Write a function posX=findPosition(x,y) where x is a vector and y is the number that you are searching for.

%Examples:
% findPosition([1 3 5 4 2], 2)
% posX is 5
% findPosition([1 5 8 6 7 6 0], 8)
% posX is 3

t = x==p;
for i=1:length(t)
    if t(i) == 1
        y = i;
        break;
    end
end
