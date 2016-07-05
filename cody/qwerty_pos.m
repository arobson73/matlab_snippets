function [r,c]  = qwerty_pos(in)

%Given a lowercase letter or a digit as input, return the row where that letter appears on a standard U.S. QWERTY keyboard and its position starting from the leftmost digit or letter on that row.

%Examples:
% Input  key = 'a'
% Output r = 3
%        c = 1
% Input  key = '0'
% Output r = 1
%        c = 10
% Input  key = 'y'
% Output r = 2
%        c = 6

row1 = '1234567890';
row2 = 'qwertyuiop';
row3 = 'asdfghjkl_';
row4 = 'zxcvbnm___';

M = [row1;row2;row3;row4];

in = lower(in);

for i = 1:4
    if ~isempty(find(M(i,:)==in))
        r=i;
        c = find(M(i,:)==in);
        break;
    end
end

