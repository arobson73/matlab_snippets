function y = sums_with_excluded_digits(r,x)

%Add all the integers from 1 to n in which the digit m does not appear. m will always be a single digit integer from 0 to 9.
% no_digit_sum(10,1) = 44

%because 1 and 10 are excluded from the sum and
% sum(2:9) = 44

digits = 1:r;
xs = num2str(x);
y=0;
for i = 1:length(digits)
    str = num2str(digits(i));
    if isempty(find(str==xs))
        y = y + digits(i);
    end
end

