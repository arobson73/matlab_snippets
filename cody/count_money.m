function y = count_money(x)

%Add the numbers given in the cell array of strings. The strings represent amounts of money using this notation: $99,999.99.

%Example:
% Input a = {'$12,001.87','$0.04','$12,003,887.55','$0.32'};
% Output b is 12015889.78
%for each string remove the non numbers except the decimal
sm = 0;
for i = 1: length(x)
    %get string
    s = cell2mat(x(i));
    %remove dollar
    s(strfind(s,'$')) = [];
    s(strfind(s,',')) = [];
    sm = sm + str2num(s);
end
y = sm;


