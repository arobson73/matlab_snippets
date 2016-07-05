function y = remove_dups(x)

%Remove all the redundant elements in a vector, but keep the first occurrence of each value in its original location. So if
% a = [5 3 6 4 7 7 3 5 9]

%then
% dedupe(a) = [5 3 6 4 7 9]

s = [];
y = [];
for i  = 1 : length(x)
    if isempty(find(s==x(i)))
        s = [s x(i)];
        y = [y x(i)];
    end

end
