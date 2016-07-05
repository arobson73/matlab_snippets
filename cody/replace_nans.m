function y = replace_nans(x)

%Replace NaNs with the number that appears to its left in the row.

%If there are more than one consecutive NaNs, they should all be replaced by the first non-NaN value to the immediate left of the left-most NaN. If the NaN is in the first column, default to zero.

%For example, if
%x = [NaN  1   2  NaN NaN 17  3  -4 NaN]


%then
%y = [ 0   1   2   2   2  17  3  -4  -4]
y = x;
nanpos = isnan(x);
if( nanpos(1) )
    y(1) = 0;
end
prev = y(1);
for i = 2:length(x)
    if (nanpos(i))
        y(i) = prev;
    else
        prev = x(i);
    end
    
end

