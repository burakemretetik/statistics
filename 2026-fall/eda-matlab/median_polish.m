function [overall, row, col, res] = median_polish(x, iters)
if nargin < 2
    iters = 25;
end
res = x;
[nr, nc] = size(x);
row = zeros(nr, 1);
col = zeros(1, nc);
overall = 0;
for it = 1:iters
    rm = median(res, 2);
    res = res - rm;
    row = row + rm;
    delta = median(col);
    col = col - delta;
    overall = overall + delta;

    cm = median(res, 1);
    res = res - cm;
    col = col + cm;
    delta = median(row);
    row = row - delta;
    overall = overall + delta;

    if all(abs([rm; cm(:)]) < 1e-8)
        break
    end
end
end
