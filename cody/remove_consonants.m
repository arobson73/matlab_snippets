function y = remove_consonants(x)

%Remove all the consonants in the given phrase.

%Example:
% Input  s1 = 'Jack and Jill went up the hill'; 
% Output s2 is 'a a i e u e i';
const = 'bcdfghjklmnpqrstvwxyz';
constU = upper(const);
c = [const constU];
y=[];
for i=1:length(x)
    if isempty(find(c==x(i)))
        y = [y x(i)];
 %       y = [y ' '];
 %       if x(i) == ''''
  %          y = [y ''''];
  %     end
    end
    
end
%y(end)=[];

