method_a <- c(78, 82, 75, 88, 91, 69, 84, 80, 77, 86)
method_b <- c(72, 70, 79, 68, 74, 81, 66, 73, 70)

t.test(method_a, method_b)$conf.int
t.test(method_a, method_b, var.equal = TRUE)$conf.int

# from summary statistics only
ci_diff <- function(m1, s1, n1, m2, s2, n2, level = 0.95, pooled = FALSE) {
  if (pooled) {
    sp2 <- ((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2)
    se <- sqrt(sp2 * (1 / n1 + 1 / n2)); df <- n1 + n2 - 2
  } else {
    se <- sqrt(s1^2 / n1 + s2^2 / n2)
    df <- se^4 / ((s1^2 / n1)^2 / (n1 - 1) + (s2^2 / n2)^2 / (n2 - 1))
  }
  (m1 - m2) + c(-1, 1) * qt(1 - (1 - level) / 2, df) * se
}
ci_diff(64.2, 8.1, 35, 59.8, 9.4, 40)
ci_diff(64.2, 8.1, 35, 59.8, 9.4, 40, pooled = TRUE)

# proportions: 58/120 vs 41/115
p1 <- 58 / 120; p2 <- 41 / 115
(p1 - p2) + c(-1, 1) * qnorm(0.975) * sqrt(p1 * (1 - p1) / 120 + p2 * (1 - p2) / 115)
prop.test(c(58, 41), c(120, 115), correct = FALSE)$conf.int

# ratio of variances
var.test(method_a, method_b)$conf.int
f <- var(method_a) / var(method_b)
f / qf(c(0.975, 0.025), length(method_a) - 1, length(method_b) - 1)

# paired
before <- c(142, 138, 150, 145, 160, 155, 148, 152)
after <- c(135, 136, 141, 140, 151, 150, 146, 144)
d <- before - after
mean(d) + c(-1, 1) * qt(0.975, length(d) - 1) * sd(d) / sqrt(length(d))
t.test(before, after, paired = TRUE)$conf.int
# treating them as independent gives a much wider interval
t.test(before, after)$conf.int
