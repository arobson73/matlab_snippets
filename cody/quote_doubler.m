function y = quote_doubler(x)

%Given a string s1, find all occurrences of the single quote character and replace them with two occurrences of the single quote character.

%If there are n such occurrences in s1, then s2 will be n characters longer than s1.
y =[];
for i = 1:length(x)
    if x(i) == ''''
        y = [y x(i) ''''];
    else
        y= [y x(i)];
    end

end

