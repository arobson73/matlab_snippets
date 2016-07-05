function y = balance_number(x)

%Given a positive integer find whether it is a balanced number. For a balanced number the sum of first half of digits is equal to the second half.

%Examples:
% Input  n = 13722 
% Output tf is true

%because 1 + 3 = 2 + 2.
% Input  n = 23567414 
% Output tf = true

%All palindrome numbers are balanced.

%This is partly from Project Euler, Problem 217.
s = num2str(x);
len = length(s);
if mod(len,2)
    %its odd length
    low = s(1:floor(len/2));
    high = s(ceil(len/2)+1 : end);
else
    low = s(1:len/2);
    high = s((len/2)+1:end);
end
slow=0;
shigh=0;
for i= 1:length(low)
    slow = slow + str2num(low(i));
    shigh = shigh + str2num(high(i));
end

if(slow == shigh)
    y = 1;
else
    y = 0;
end
