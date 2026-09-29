function lv = letter_values(x)
% rows: depth, lower, mid, upper, spread for M, F, E, D, C, ...
x = sort(x(:));
n = numel(x);
d = (n + 1) / 2;
lv = [];
while d >= 1
    lower = (x(floor(d)) + x(ceil(d))) / 2;
    upper = (x(n + 1 - floor(d)) + x(n + 1 - ceil(d))) / 2;
    lv = [lv; d, lower, (lower + upper) / 2, upper, upper - lower];
    if d == 1
        break
    end
    d = (floor(d) + 1) / 2;
end
end
