% survival times (days) of 25 patients
x = [37 52 90 56 58 45 66 75 36 43 64 71 49 81 59 47 68 39 77 54 62 48 70 85 51]';

xs = sort(x)';
n = length(x)

low = x(x <= 40)'
up = x(x >= 70)'
percent_low = 100 * numel(low) / n
percent_up = 100 * numel(up) / n
percent_tails = 100 * sum(x <= 40 | x >= 70) / n
impossible = sum(x <= 40 & x >= 70)
not_37 = sum(x ~= 37)
idx = find(x > 80)'

stem_leaf(x)

lv = letter_values(x)
F = lv(2, [2 4]);
dF = F(2) - F(1);
fences = [F(1) - 1.5 * dF, F(2) + 1.5 * dF]
outliers = x(x < fences(1) | x > fences(2))'

rng(1);
r1 = randn(1, 3)
rng(1);
r2 = randn(1, 3)
% same seed, same numbers

figure;
boxplot(x, 'orientation', 'horizontal');
title('Survival times');
