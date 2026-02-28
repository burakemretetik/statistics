birth_weight <- c(3.1, 3.4, 2.9, 3.6, 3.2, 3.8, 3.0, 3.3, 3.5, 2.8, 3.4, 3.1)
n <- length(birth_weight)
xbar <- mean(birth_weight)
s <- sd(birth_weight)

# sigma known (0.3)
xbar + c(-1, 1) * qnorm(0.975) * 0.3 / sqrt(n)

# sigma unknown
xbar + c(-1, 1) * qt(0.975, n - 1) * s / sqrt(n)
t.test(birth_weight)$conf.int

ci_t <- function(x, level = 0.95) {
  n <- length(x)
  half <- qt(1 - (1 - level) / 2, n - 1) * sd(x) / sqrt(n)
  c(lower = mean(x) - half, upper = mean(x) + half)
}
sapply(c(0.90, 0.95, 0.99), function(l) ci_t(birth_weight, l))

# variance
(n - 1) * var(birth_weight) / qchisq(c(0.975, 0.025), n - 1)

# proportion: 132 of 400 voters
x <- 132; m <- 400; p_hat <- x / m
wald <- p_hat + c(-1, 1) * qnorm(0.975) * sqrt(p_hat * (1 - p_hat) / m)
wald
prop.test(x, m, correct = FALSE)$conf.int
binom.test(x, m)$conf.int

# sample size for margin 0.03 with p unknown
ceiling(qnorm(0.975)^2 * 0.25 / 0.03^2)
# sample size for mean, sigma 0.3, margin 0.1
ceiling((qnorm(0.975) * 0.3 / 0.1)^2)

# how often does a 95% interval catch mu?
set.seed(5)
covers <- replicate(2000, {
  y <- rnorm(15, mean = 50, sd = 8)
  ci <- ci_t(y)
  ci[1] < 50 && 50 < ci[2]
})
mean(covers)

intervals <- t(replicate(50, ci_t(rnorm(15, 50, 8))))
miss <- intervals[, 1] > 50 | intervals[, 2] < 50
plot(NULL, xlim = range(intervals), ylim = c(1, 50), xlab = "", ylab = "sample")
segments(intervals[, 1], 1:50, intervals[, 2], 1:50, col = ifelse(miss, "red", "grey30"))
abline(v = 50, lty = 2)
