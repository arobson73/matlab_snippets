function m = swap_column(m,a,b)
%m is vector or matrix, a & b are column index

if (size(m,2) ==1)
    return
end
t = m(:,a);
m(:,a) = m(:,b);
m(:,b)= t;

