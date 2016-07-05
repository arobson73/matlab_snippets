function y = rem_vowels(x)
%remove the vowels from string
vow = ['a' 'e' 'i' 'o' 'u' 'A' 'E' 'I' 'O' 'U'];
y=[];
for i = 1:length(x)
    if isempty(find(vow==x(i)))
        y = [y x(i)];
    end  
end


