function y = extract_leading_non_zero(x)

%Benford's Law states that the distribution of leading digits is not random. This is probably because many things grow logarithmically. Extract the leading digit from these vectors.
%10 --> 1
%13 --> 1
%0.3 --> 3
%-4 --> 4
%-5 --> 5
%-0.006 --> 6

%Input will be a vector
% x = [1 0.3 -2 0.001 -0.0006, 582398, 3020];

%Output should be
% y = [1 3 2 1 6 5 3];
y = [];
for i=1:length(x)
    y = [y str2num(get_first_digit(num2str(x(i))))];
end

function y = get_first_digit(x)
erase = '-0.';
for i=1:length(x)
    if isempty(find(erase==x(i)))
        y = x(i);
        break;
    end
end
end

end
