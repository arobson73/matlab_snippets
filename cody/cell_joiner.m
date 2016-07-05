function y = cell_joiner(x,delim)
    
%You are given a cell array of strings and a string delimiter. You need to produce one string which is composed of each string from the cell array separated by the delimiter.

%For example, this input
% in_cell = {'Lorem', 'ipsum', 'dolor', 'sit', 'amet', 'consectetur'};
% delim = ' ';

%should produce this output:
% out_str = 'Lorem ipsum dolor sit amet consectetur';
sz = size(x,2) -1;
for i = 1: sz
    x{i} = [x{i} delim];
end
y = cell2mat(x);

