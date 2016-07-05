function y = sum_digits_in_text(x)

%Given a string with text and digits, add all the numbers together.

%Examples:
% Input str = '4 and 20 blackbirds baked in a pie'
% Output total is 24
% Input str = '2 4 6 8 who do we appreciate?'
% Output total is 20
x= upper(x);
n =[];
for i = 1: length(x)
    if isempty(str2num(x(i))) && x(i) ~= ' ' 
        n=[n ' '];
    else
        n =[n x(i)];
    end
end
y = sum(str2num(n));
