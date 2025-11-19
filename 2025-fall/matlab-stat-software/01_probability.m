% X ~ N(4, 5^2)
p_less6 = cdf('Normal', 6, 4, 5)
p_more6 = 1 - cdf('Normal', 6, 4, 5)
p_between = normcdf(10, 4, 5) - normcdf(0, 4, 5)

p_unif = 1 - cdf('Uniform', 0.3, 0, 1)

% service rate 0.4 cars/hour -> mean time 2.5 h
p_service = cdf('Exponential', 4, 1/0.4)

% 5000 accidents a year on average
p_accidents = cdf('Poisson', 5500, 5000) - cdf('Poisson', 2999, 5000)

% 2 plane crashes a year on average
p_2_or_3 = cdf('Poisson', 3, 2) - cdf('Poisson', 1, 2)
p_exactly3 = pdf('Poisson', 3, 2)

% 3 children, exactly 2 boys
p_two_boys = pdf('Binomial', 2, 3, 0.5)

% defect rate 0.02, at least 300 good items before the first defect
p_300 = 1 - cdf('Geometric', 299, 0.02)
p_atmost300 = cdf('Geometric', 300, 0.02)

x = 0:10;
figure;
subplot(1, 2, 1);
stem(x, binopdf(x, 10, 0.3));
title('Bin(10, 0.3)');
subplot(1, 2, 2);
stairs(x, binocdf(x, 10, 0.3));
title('CDF');

z = [norminv(0.025), norminv(0.975)]
t_crit = tinv(0.975, [5 10 30])
