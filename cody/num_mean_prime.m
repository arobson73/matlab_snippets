function y = num_mean_prime(x)
%finds the numeric mean of the prime numbers in matrix x
x = x(:);
p = x((find(isprime(x))));
y = sum(p)/length(p);
