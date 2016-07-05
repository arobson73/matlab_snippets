function y = reverse_run_length(x)

%Given a "counting sequence" vector x, construct the original sequence y.

%A counting sequence is formed by "counting" the entries in a given sequence. This is sometimes called run-length encoding.

%For example, the sequence
% x = 2, 5, 1, 2, 4, 1, 1, 3

%can be read as
% Two 5's, one 2, four 1's, one 3

%which translates to
% y = 5, 5, 2, 1, 1, 1, 1, 3

%So y is the reconstructed vector that corresponds to the counting sequence x.

%For this problem, all elements in the sequences x and y will be in the range from 1 to 9.
len = length(x)/2;
r = reshape(x,2,len);
y = [];
for i = 1:len
    c = r(1,i);
    c = ones(1,c);
    v = r(2,i);
    v = v*c;
    y = [y v];
end 
