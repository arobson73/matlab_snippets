function y= target_sort(a,t)

%%Sort the given list of numbers a according to how far away each element is from the target value t. The result should return the list sorted in descending order of the absolute value of the difference between a(n) and t.

%So if a = [1 2 4 8 17] and t = 12, then the output b should be [1 2 4 17 8].
%first row is sorted absolute diff, second row is absolute difference, third row is current
y =zeros(1,length(a));
g = [sort(abs(a-t),'descend'); abs(a - t)];
for i=1:length(a)
    new_idx = find(g(1,:)==g(2,i));
    y(new_idx) = a(i);
end

