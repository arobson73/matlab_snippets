function y = pangram(x)

%A pangram, or holoalphabetic sentence, is a sentence using every letter of the alphabet at least once.

%Example:
% Input  s = 'The quick brown fox jumps over the lazy dogs'
% Output tf = true

x = lower(x);
aindex = 'abcdefghijklmnopqrstuvwxyz';
count_index = zeros(1,26);
for i = 1: length(x)
    j = find(aindex==x(i));
    if ~isempty(j)
        count_index(j) = 1;
    end
end

if sum(count_index) == 26
    y = 1;
else
    y = 0;
end

