function y = pattern_match(x)
%Given a matrix, m-by-n, find all the rows that have the same "increase, decrease, or stay same" pattern going across the columns as the first row does. Do not list the row as a match to itself.
%Example:
% Input  a = [1 2 3 0
%             5 6 7 9
%             2 7 8 7]
% Output b is 3

%since the third column follows the increase-increase-decrease pattern used in vector a.

d = diff(x,1,2); %diff each column of each row
%is neg make -1, if pos, make 1 for each row
d(find(d < 0)) = -1;
d(find(d > 0)) = 1;
a = find(ismember(d,d(1,:),'rows') == 1);%find matches with the first row
y =a(2:end)';%output those rows indexs that match the first row

