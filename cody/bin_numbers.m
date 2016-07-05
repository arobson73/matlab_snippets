function y = bin_numbers(n)

%%Given a positive, scalar integer n, create a (2^n)-by-n double-precision matrix containing the binary numbers from 0 through 2^n-1. Each row of the matrix represents one binary number. For example, if n = 3, then your code could return

%%>> binary_numbers(3)

%%ans =
%     1     1     1
%     0     0     0
%     0     1     1
%     0     1     0
%     0     0     1
%     1     0     0
%     1     1     0
%     1     0     1

%The order of the rows does not matter.
if n == 1
    y = [0;1];
    return;
end


mx_bits = ceil(log2(2^n-1));
y=[];
for i = 0:2^n-1
    y(i+1,:) = dec2bin(i,mx_bits)=='1';

end
