function y = longest_1_run(x)

%Given a string such as
% s = '011110010000000100010111'

%find the length of the longest string of consecutive 1's. In this example, the answer would be 4.

%Example:
% Input  x = '110100111'
% Output y is 3
cur_max=0;
y=0;
for i = 1:length(x)
    if( (x(i)) == '1')
        cur_max = cur_max + 1;
        if (cur_max > y)
            y = cur_max;
        end
    else
        cur_max = 0;
    end    
end
