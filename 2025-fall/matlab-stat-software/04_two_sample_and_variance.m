% hemoglobin of 15 year olds
boys = [12.5 12.7 11.8 12.2 12.0 11.9 12.0 11.6 10.9 12.7 13.0 12.3 12.7 12.6 11.8 11.7 11.6]';
girls = [11.5 11.3 10.9 10.8 11.2 11.8 12.2 11.7 11.6 10.9 12.0 12.0]';

% H1: mu_boys > mu_girls
[h, p, ci, stats] = ttest2(boys, girls, 'Tail', 'right')
[h, p, ci, stats] = ttest2(boys, girls, 'Tail', 'right', 'Vartype', 'unequal')

% monthly cultural spending, H1: sigma^2 > 400
y = [40; 60; 40; 100; 30; 30; 120; 50; 70];
[h, p, ci, stats] = vartest(y, 400, 'Tail', 'right')
chi2 = (numel(y) - 1) * var(y) / 400
p_manual = 1 - chi2cdf(chi2, numel(y) - 1)

% are the variances different?
[h, p, ci, stats] = vartest2(girls, boys)
[h, p, ci, stats] = vartest2(girls, boys, 'Tail', 'left')

figure;
boxplot([boys; girls], [ones(size(boys)); 2 * ones(size(girls))]);
title('Hemoglobin: boys (1) vs girls (2)');
