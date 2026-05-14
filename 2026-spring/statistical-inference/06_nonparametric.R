waiting <- c(12, 15, 9, 22, 31, 8, 14, 45, 11, 18, 10, 27)
shapiro.test(waiting)

# sign test for median = 15
above <- sum(waiting > 15); used <- sum(waiting != 15)
binom.test(above, used, 0.5)

wilcox.test(waiting, mu = 15, exact = FALSE)

before <- c(7, 5, 8, 6, 9, 4, 7, 6, 8, 5)
after <- c(5, 4, 6, 6, 6, 3, 5, 4, 7, 5)
wilcox.test(before, after, paired = TRUE, exact = FALSE)

city <- c(68, 72, 75, 61, 80, 77, 70)
rural <- c(55, 60, 58, 65, 52, 63)
wilcox.test(city, rural, exact = FALSE)

r <- rank(c(city, rural))
W <- sum(r[seq_along(city)]) - length(city) * (length(city) + 1) / 2
W

groups <- list(a = c(3, 5, 4, 6, 2), b = c(7, 8, 6, 9, 7), c = c(4, 6, 5, 5, 3))
kruskal.test(groups)

hours <- c(2, 5, 1, 8, 4, 6, 3, 7)
grade <- c(55, 70, 48, 92, 66, 75, 60, 81)
cor.test(hours, grade, method = "spearman")
cor.test(hours, grade, method = "kendall")

runs_test <- function(x) {
  s <- x > median(x)
  runs <- 1 + sum(s[-1] != s[-length(s)])
  n1 <- sum(s); n2 <- sum(!s)
  mu <- 2 * n1 * n2 / (n1 + n2) + 1
  v <- 2 * n1 * n2 * (2 * n1 * n2 - n1 - n2) / ((n1 + n2)^2 * (n1 + n2 - 1))
  z <- (runs - mu) / sqrt(v)
  c(runs = runs, z = z, p = 2 * pnorm(-abs(z)))
}
set.seed(8)
runs_test(rnorm(40))
runs_test(cumsum(rnorm(40)))

ks.test(waiting, "pexp", 1 / mean(waiting))
