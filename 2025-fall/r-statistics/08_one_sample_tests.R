weights <- c(498, 503, 495, 507, 492, 500, 511, 489, 497, 502, 506, 494)

z_test <- function(x, mu0, sigma, alternative = c("two.sided", "less", "greater")) {
  alternative <- match.arg(alternative)
  z <- (mean(x) - mu0) / (sigma / sqrt(length(x)))
  p <- switch(alternative,
              two.sided = 2 * pnorm(-abs(z)),
              less = pnorm(z),
              greater = pnorm(z, lower.tail = FALSE))
  c(mean = mean(x), z = z, p.value = p)
}

z_test(weights, mu0 = 500, sigma = 6)
z_test(weights, mu0 = 505, sigma = 6, "less")

t.test(weights, mu = 500)
t.test(weights, mu = 505, alternative = "less")
t.test(weights, conf.level = 0.99)$conf.int

xbar <- mean(weights); s <- sd(weights); n <- length(weights)
t_stat <- (xbar - 500) / (s / sqrt(n))
c(t = t_stat, p = 2 * pt(-abs(t_stat), n - 1))

# 58 of 120 students say yes, is it different from 40%?
prop.test(58, 120, p = 0.4)
binom.test(58, 120, p = 0.4)

p_hat <- 58 / 120
z <- (p_hat - 0.4) / sqrt(0.4 * 0.6 / 120)
c(z = z, p = 2 * pnorm(-abs(z)))

# variance: H0 sigma^2 = 25
var_test <- function(x, sigma2) {
  n <- length(x)
  chi <- (n - 1) * var(x) / sigma2
  p <- 2 * min(pchisq(chi, n - 1), pchisq(chi, n - 1, lower.tail = FALSE))
  ci <- (n - 1) * var(x) / qchisq(c(0.975, 0.025), n - 1)
  list(statistic = chi, p.value = p, conf.int = ci)
}
var_test(weights, 25)

shapiro.test(weights)
qqnorm(weights); qqline(weights)

skewed <- rexp(40)
shapiro.test(skewed)
