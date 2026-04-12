fill <- c(498, 502, 495, 501, 497, 499, 494, 500, 496, 498, 503, 493)

t.test(fill, mu = 500)
t.test(fill, mu = 500, alternative = "less")

decide <- function(p, alpha = 0.05) if (p < alpha) "reject H0" else "fail to reject H0"
p <- t.test(fill, mu = 500, alternative = "less")$p.value
decide(p)
decide(p, 0.01)

# critical value approach
t_stat <- (mean(fill) - 500) / (sd(fill) / sqrt(length(fill)))
c(t = t_stat, critical = qt(0.05, length(fill) - 1))

# proportion: 45 defective in 100, claim is 50%
prop.test(45, 100, p = 0.5)
binom.test(45, 100, p = 0.5)

# variance: is sigma^2 > 2?
x <- c(10, 12, 11, 13, 10, 12, 11, 14, 10, 11)
chi2 <- (length(x) - 1) * var(x) / 2
c(chi2 = chi2, p = pchisq(chi2, length(x) - 1, lower.tail = FALSE))

# type I error rate when H0 is true
set.seed(11)
pvals <- replicate(5000, t.test(rnorm(20, 100, 15), mu = 100)$p.value)
mean(pvals < 0.05)
hist(pvals, breaks = 20, main = "p-values under H0")

# power
power_sim <- function(delta, n, sd = 15, reps = 2000) {
  mean(replicate(reps, t.test(rnorm(n, 100 + delta, sd), mu = 100)$p.value < 0.05))
}
sapply(c(0, 5, 10, 15), power_sim, n = 20)
power.t.test(n = 20, delta = 10, sd = 15, type = "one.sample")$power
power.t.test(delta = 5, sd = 15, power = 0.8, type = "one.sample")$n

deltas <- seq(0, 20, by = 1)
plot(deltas, sapply(deltas, function(d) power.t.test(n = 20, delta = d, sd = 15, type = "one.sample")$power),
     type = "l", ylab = "power", xlab = "true difference")
lines(deltas, sapply(deltas, function(d) power.t.test(n = 50, delta = d, sd = 15, type = "one.sample")$power), lty = 2)
legend("bottomright", c("n = 20", "n = 50"), lty = 1:2)
