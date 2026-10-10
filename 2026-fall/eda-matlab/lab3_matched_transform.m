% household water use (liters/day), one large value
x = [778 355 248 200 412 186 301 520 233 268 190 345 610 222 289 1450 260 395 215 330]';

% match log10 to the raw scale at the median: z = a + b*log10(x), dz/dx = 1 at m
m = median(x);
b = m / log10(exp(1));
a = m - b * log10(m);
logx = log10(x);
z = a + b * logx;

[x logx z]

% matched square root
bs = 2 * sqrt(m);
as = m - bs * sqrt(m);
zs = as + bs * sqrt(x);

lv_raw = letter_values(x);
lv_log = letter_values(z);
lv_sqrt = letter_values(zs);
spreads = [lv_raw(2:3, 5) lv_log(2:3, 5) lv_sqrt(2:3, 5)]
mids = [lv_raw(2:3, 3) lv_log(2:3, 3) lv_sqrt(2:3, 3)]

figure;
data = {x, z, zs};
names = {'raw', 'matched log', 'matched sqrt'};
for k = 1:3
    subplot(3, 2, 2 * k - 1); hist(data{k}, 10); title(['Histogram: ' names{k}]);
    subplot(3, 2, 2 * k); boxplot(data{k}, 'orientation', 'horizontal'); title(['Boxplot: ' names{k}]);
end
