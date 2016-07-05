function y = alphabet_word_prod(x)

%%If the input string s is a word like 'hello', then the output
%word product p is a number based on the correspondence a=1, b=2,
... z=26. 
%Assume the input will be a single word, although it may mixed case. 
%Note that A=a=1 and B=b=2.

%So
% s = 'hello'

%means
% p = 8 * 5 * 12 * 12 * 15 = 86400

%Bonus question: How close can you get to a word product of one million?

alpha = 'abcdefghijklmnopqrstuvwxyz';
x = lower(x);
s=1;
for i =1:length(x)
    s= s * find(alpha==x(i)); 
end 
y=s;
