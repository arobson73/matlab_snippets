function y = bullseye(n)

%%Given n (always odd), return output a that has concentric rings of the numbers 1 through (n+1)/2 around the center point. Examples:
% Input  n = 3
% Output a is [ 2 2 2 
%               2 1 2
%               2 2 2 ]
% Input  n = 5
% Output a is [ 3 3 3 3 3
%               3 2 2 2 3 
%               3 2 1 2 3
%               3 2 2 2 3 
%               3 3 3 3 3 ]
n = abs(n);
if mod(n,2) == 0
    display('input n must be odd');
    n = n+1;
    display('input n converted to next odd number up');    
    n
end
ring_length = 1:2:n;
ring_val = 2:length(ring_length);
test = 1;
for i = 1:length(ring_length)-1
    %add columns either side to current
    test = [ ones(ring_length(i),1)*ring_val(i) test ones(ring_length(i),1)*ring_val(i)];
    %add new rows to top and bottom of current
    test = [ones(1,ring_length(i+1))*ring_val(i) ; test ; ones(1,ring_length(i+1))*ring_val(i)];   
   
end

y = test;
