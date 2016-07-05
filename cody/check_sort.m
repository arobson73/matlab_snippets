function y = check_sort(x)

y = ~max(diff(x) < 0);
