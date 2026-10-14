function [b, fitted, res, xM] = resistant_line(x, y, iters)
% Tukey's three group resistant line, y = b(1) + b(2)*(x - xM)
if nargin < 3
    iters = 10;
end
x = x(:); y = y(:);
n = numel(x);
[xs, ord] = sort(x);
ys = y(ord);

k = round(n / 3);
L = 1:k; R = n - k + 1:n; Mid = k + 1:n - k;
xL = median(xs(L)); xM = median(xs(Mid)); xR = median(xs(R));

slope = 0; level = 0;
r = ys;
for it = 1:iters
    db = (median(r(R)) - median(r(L))) / (xR - xL);
    slope = slope + db;
    r = ys - slope * (xs - xM);
    if abs(db) < 1e-6 * max(1, abs(slope))
        break
    end
end
level = mean([median(r(L)) median(r(Mid)) median(r(R))]);

b = [level; slope];
fitted = level + slope * (x - xM);
res = y - fitted;
end
