% four groups, NaN where a group has fewer observations
x = [100  75  45  55;
      90  80  25  45;
      80  50  35 100;
      60  45  95 185;
      70  35 105 155;
      50  25 125 175;
      15  95  35 145;
      10  87  85 125;
       5  65   7  75;
       8  15 NaN  25;
     NaN   5 NaN  35;
     NaN NaN NaN  45];

[p, tbl, stats] = anova1(x, [], 'off')
group_means = stats.means
mse = stats.s ^ 2
F_crit = finv(0.95, 3, 38)
% p < 0.05 so at least one mean differs

% feed eaten in 350 days vs starting weight of 6 hens
w = [2.08; 2.31; 2.17; 1.99; 2.67; 2.13];
feed = [39.45; 42.17; 40.68; 41.40; 45.07; 41.72];

X = [ones(size(w)) w];
[b, bint, r, rint, st] = regress(feed, X)
% st = [R^2 F p error_variance]

yhat = X * b;
figure;
subplot(1, 2, 1);
plot(w, feed, 'o', w, yhat, '-');
xlabel('weight'); ylabel('feed');
subplot(1, 2, 2);
plot(yhat, r, '*'); hold on; plot(xlim, [0 0], '--');
title('residuals');
