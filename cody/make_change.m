function y = make_change(x)

%Given an amount of currency, return a vector of this form:
% [100 50 20 10 5 2 1 0.5 0.25 0.1 0.05 0.01]

%Example:
% Input a = 257.68
% Output b is [2 1 0 0 1 1 0 1 0 1 1 3]

%Always use bigger bills/coins if possible.

coins = [100 50 20 10 5 2 1 0.5 0.25 0.1 0.05 0.01];
t = x;
y =[];
for i=1:length(coins)
    d = fix(t / coins(i));
    y = [y d];
    %round up  5th decimal place since sometimes double will represent 0.01 as 0.009999
    t =     round(t - d*coins(i),5);
end
