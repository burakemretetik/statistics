% fasting blood sugar of 14 healthy people
x = [79; 95; 65; 81; 82; 79; 80; 76; 85; 70; 83; 77; 102; 95];

n = numel(x)
avg = mean(x)
med = median(x)
md = mode(x)
q = quantile(x, [0.25 0.42 0.5 0.75])
rng_x = range(x)
iqr_x = iqr(x)

s = std(x)
sigma = std(x, 1)
v = var(x)
v_pop = var(x, 1)
cv = s / avg

sk = skewness(x)
ku = kurtosis(x)
g = geomean(x)
h = harmmean(x)

sorted = sort(x)'
z = (x - avg) / s;
outliers = x(abs(z) > 2)'

figure;
subplot(1, 3, 1); boxplot(x); title('Boxplot');
subplot(1, 3, 2); hist(x, 4); title('Histogram');
subplot(1, 3, 3); qqplot(x); title('Q-Q plot');
