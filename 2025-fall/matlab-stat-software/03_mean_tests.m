% pipes weigh N(300, 24^2); new technique, 15 pipes
rng(3);
x = normrnd(252, 24, 15, 1);
mean(x)

% H0: mu >= 300, H1: mu < 300, sigma known
[h, p, ci, zstat] = ztest(x, 300, 24, 'Tail', 'left')

% sigma unknown
[h, p, ci, stats] = ttest(x, 300, 'Tail', 'left')

z_manual = (mean(x) - 300) / (24 / sqrt(numel(x)))
p_manual = normcdf(z_manual)

% weights before and after military service
pairs = [65 57; 72 72; 44 46; 97 87; 54 48; 62 62; 69 69; 85 81; 96 92; 83 83; 123 117];
d = pairs(:, 2) - pairs(:, 1);
[h, p, ci, stats] = ttest(d, 0, 'Alpha', 0.01)
% p > 0.01, can't say the weight changed
