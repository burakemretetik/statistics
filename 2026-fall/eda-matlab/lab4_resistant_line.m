% age (months) and height (cm) of 18 boys
age = [109 113 115 116 119 120 121 124 126 129 130 133 134 135 137 139 141 140]';
height = [137.6 147.8 136.8 140.7 132.7 145.4 135.0 133.0 148.5 148.3 147.5 148.8 133.2 148.7 152.0 150.6 165.3 149.9]';

[b, fitted, res, xM] = resistant_line(age, height)
fprintf('height = %.3f + %.4f (age - %g)\n', b(1), b(2), xM);
predicted_145 = b(1) + b(2) * (145 - xM)

X = [ones(size(age)) age];
beta_ls = X \ height
yhat = X * beta_ls;

H = X / (X' * X) * X';
leverage = diag(H);
high = find(leverage > 2 * 2 / numel(age))'

figure;
subplot(1, 2, 1);
plot(age, height, '*', age, fitted, 'g-', age, yhat, 'r--');
legend('data', 'resistant', 'least squares', 'Location', 'northwest');
subplot(1, 2, 2);
plot(age, res, 'o'); hold on; plot(xlim, [0 0], 'k--'); hold off;
title('resistant line residuals');
