function stem_leaf(x, unit)
% unit is the leaf unit, e.g. 0.1 means 22.9 -> stem 22, leaf 9
if nargin < 2
    unit = 1;
end
v = floor(sort(x(:)) / unit);
stems = floor(v / 10);
leaves = mod(v, 10);
fprintf('leaf unit = %g, n = %d\n', unit, numel(x));
for s = min(stems):max(stems)
    fprintf('%5d | %s\n', s, sprintf('%d', leaves(stems == s)));
end
end
