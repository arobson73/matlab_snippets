function y = cat_strings(varargin)

%If you have two small strings, like 'a' and 'b', return them put together like 'ab'.
%     'a' and 'b' => 'ab'

%For extra credit, combine any number of strings.
number_of_strings = nargin;
y=[];
for i = 1:number_of_strings
    y = strcat(y,cell2mat(varargin(i)));
end

