function y = occur_3_times(x)

%%Return a list of all values (sorted smallest to largest) that appear exactly three times in the input vector x. So if
% x = [1 2 5 2 2 7 8 3 3 1 3 8 8 8]

%then
% y = [2 3]

s = sort(x);
t  = unique(s);
y=[];
for i = 1:length(t)
    if length(find(s==t(i))) == 3
        y = [y t(i)];
    end
end

