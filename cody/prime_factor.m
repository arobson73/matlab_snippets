function y = prime_factor(x)

%List the prime factors for the input number, in decreasing order. List each factor only once, even if the factorization includes it multiple times.

%Examples:

%in = 137 ---> out = 137

%in = 876 ---> out = [73 3 2]

y = sort(unique(factor(x)),2,'descend');
