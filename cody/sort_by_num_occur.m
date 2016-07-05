function y = sort_by_num_occur(x)


%Given a vector x, return a vector y of the unique values in x sorted by the number of occurrences in x.

%Ties are resolved by a sort from lowest to highest.

%So if
% x = [1 2 2 2 3 3 7 7 93]

%then
% y = [2 3 7 1 93]

u = unique(x);
v = [];
for i = 1: length(u)
    v(i) = sum(x==u(i));
end
a = [u;v;sort(v,2,'descend')];
y=[];
skip=0;
for i=1:length(u)
    if (skip)
        skip = skip-1;
        continue;
    end
    ix = find(a(2,:)==a(3,i));
    
    y = [y a(1,ix)];
    if(length(ix) > 1)
        skip=length(ix);
    else
        skip=0;
    end
end
