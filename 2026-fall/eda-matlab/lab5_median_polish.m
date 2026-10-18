% infant deaths per 1000 births: rows = region, cols = mother's education
regions = {'North', 'East', 'South', 'West'};
x = [25.3 25.3 18.2 18.3 16.3;
     32.1 29.0 18.8 24.3 19.0;
     38.8 31.0 19.3 15.7 16.8;
     25.4 21.1 20.3 24.0 17.5];

[overall, row, col, res] = median_polish(x)

% the table is rebuilt exactly from the parts
max(max(abs(overall + row + col + res - x)))

fit_north_col1 = overall + row(1) + col(1)

[~, worst] = max(abs(res(:)));
[r, c] = ind2sub(size(res), worst);
fprintf('largest residual %.2f at %s, column %d\n', res(r, c), regions{r}, c);

% comparison value vs residual, slope near 0 means additive fit is fine
cv = (row * col) / overall;
k = polyfit(cv(:), res(:), 1)

figure;
plot(cv(:), res(:), 'o');
xlabel('comparison value'); ylabel('residual');
