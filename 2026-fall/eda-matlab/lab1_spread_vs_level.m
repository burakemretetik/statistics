% populations (100k) of the 10 largest cities in 6 countries
x = [  2.1   4.8   9.6  14.2  31.2  52.0;
       1.4   3.9   6.7  10.1  18.4  28.5;
       1.1   2.6   5.0   7.8  12.6  22.1;
       0.9   2.2   4.1   6.0  10.3  15.4;
       0.8   1.9   3.6   5.2   8.8  12.7;
       0.7   1.7   3.1   4.4   7.5  10.9;
       0.6   1.5   2.8   3.9   6.4   9.2;
       0.6   1.4   2.5   3.4   5.9   8.1;
       0.5   1.2   2.2   3.1   5.1   7.3;
       0.5   1.1   2.0   2.8   4.6   6.6];

cv = std(x) ./ mean(x)

q = prctile(x, [25 50 75]);
med = q(2, :);
spread = q(3, :) - q(1, :);

lx = log10(med)';
ly = log10(spread)';
X = [ones(size(lx)) lx];
beta = X \ ly
b = beta(2);
p = 1 - b
% p is close to 0, start with log and check the neighbouring powers

figure;
subplot(2, 2, 1); boxplot(x); title('raw');
subplot(2, 2, 2); plot(lx, ly, '*', lx, X * beta, '-'); title('log spread vs log level');

powers = [0 0.25 0.5];
for k = 1:numel(powers)
    if powers(k) == 0
        t = log10(x);
    else
        t = x .^ powers(k);
    end
    qt = prctile(t, [25 50 75]);
    r = corr(qt(2, :)', (qt(3, :) - qt(1, :))');
    fprintf('p = %.2f: correlation of level and spread = %.3f\n', powers(k), r);
end

subplot(2, 2, 3); boxplot(log10(x)); title('log10');
subplot(2, 2, 4); boxplot(sqrt(x)); title('sqrt');
