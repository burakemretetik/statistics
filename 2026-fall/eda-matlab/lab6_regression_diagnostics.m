x = [7 10 6]';
y = [15 12 9]';
[xs, ind] = sort(x);
yc = y(ind);
[xs yc]
% yc are the concomitants of the sorted x

% mortality vs population density for 20 districts, one very dense district
popden = [120 340 95 410 260 180 530 75 300 220 145 390 610 210 160 280 450 330 9699 240]';
mort = [8.2 9.1 7.9 9.6 8.8 8.4 10.2 7.6 9.0 8.7 8.1 9.4 10.6 8.6 8.3 8.9 9.9 9.2 11.8 8.7]';

n = numel(popden);
X = [ones(n, 1) popden];
beta = X \ mort
yhat = X * beta;
r = mort - yhat;

H = X / (X' * X) * X';
lev = diag(H);
s = sqrt(sum(r .^ 2) / (n - 2));
studres = r ./ (s * sqrt(1 - lev));
[~, ord] = sort(studres);
table_sorted = [studres(ord) popden(ord) mort(ord)]

high_leverage = find(lev > 2 * 2 / n)'

keep = popden ~= 9699;
X2 = X(keep, :);
beta2 = X2 \ mort(keep)
pred_9000 = [beta(1) + beta(2) * 9000, beta2(1) + beta2(2) * 9000]

figure;
subplot(2, 2, 1); plot(popden, lev, '*'); title('leverage');
subplot(2, 2, 2); plot(yhat, studres, '*'); title('studentized residuals');
subplot(2, 2, 3); qqplot(studres);
subplot(2, 2, 4);
plot(popden, mort, '*'); hold on;
plot(popden(keep), X2 * beta2, 'g-');
plot(popden, yhat, 'r--'); hold off;
title('with and without the dense district');
