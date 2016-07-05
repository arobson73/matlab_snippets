function y = multiple_3_and_5(n)

%If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

%Find the sum of all the multiples of 3 or 5 below the input value.

%Thank you to Project Euler Problem 1
n=n-1;
N=3;
K=1:n;
m3 = K(rem(K,N)==0);
N = 5;
m5 = K(rem(K,N)==0);

r = [m3 m5];
y = sum(unique(r));


