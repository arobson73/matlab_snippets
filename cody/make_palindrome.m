function y = make_palindrome(x)

%Some numbers like 323 are palindromes. Other numbers like 124 are not. But look what happens when we add that number to a reversed copy of itself.
%    124
%  + 421
%   ----
%    545

%Let's try another.
%    150
%  + 051
%   ----
%    201

%No, that didn't work, but what if we keep going?
%    201
%  + 102
%   ----
%    303
%%There, it became a palindrome again. Given a, return b = find_palindrome(a) such that b is the palindrome number that eventually results from repeated reversals and additions of a.

%Example:
% Input  a = 150
% Output b is 303
flag=1;
while(flag)
    if isPalindrome(x)
        flag = 0;
        y = x;
    else
        %flip and add
        str = num2str(x);
        strf = flip(str);
        x = str2num(str) + str2num(strf);
    end    
end
end
function y = isPalindrome(x)
    str = num2str(x);
    len = length(str);
    mid=0;
    if mod(len,2) == 0
        mid =   len/2;
    else
        mid = floor(len/2);
    end
    if (strcmp(str(1:mid),flip(str((end-mid+1):end))) )
        y = 1;
    else
        y = 0;
    end
end
