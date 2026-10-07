% repair times (hours), right skewed
x = [1.2 2.8 0.6 4.5 1.9 3.3 0.9 7.8 2.2 1.4 5.6 0.7 2.6 1.1 3.9 12.4 1.7 2.0 0.8 6.1 1.5 3.0 2.4 9.3 1.3]';

lv = letter_values(x)
% mids drift up as we go out -> skewed right

M = lv(1, 2);
xL = lv(2:end, 2);
xU = lv(2:end, 4);
h = ((xU - M).^2 + (M - xL).^2) / (4 * M);
v = (xL + xU) / 2 - M;
b = median(v ./ h)
p = 1 - b

figure;
subplot(2, 2, 1); plot(h, v, '*'); title('symmetry plot');
subplot(2, 2, 2); boxplot(x, 'orientation', 'horizontal'); title('raw');

logx = log10(x);
root4 = x .^ 0.25;
letter_values(logx)
letter_values(root4)

subplot(2, 2, 3); boxplot(logx, 'orientation', 'horizontal'); title('log10');
subplot(2, 2, 4); boxplot(root4, 'orientation', 'horizontal'); title('fourth root');

fprintf('skewness raw %.3f, log %.3f, root4 %.3f\n', skewness(x), skewness(logx), skewness(root4));
