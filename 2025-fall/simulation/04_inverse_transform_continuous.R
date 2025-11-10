exponential_rv <- function(n, lambda) -log(runif(n)) / lambda

uniform_rv <- function(n, a, b) a + (b - a) * runif(n)

weibull_rv <- function(n, shape, scale) scale * (-log(runif(n)))^(1 / shape)

triangular_rv <- function(n, a, c, b) {
  u <- runif(n)
  Fc <- (c - a) / (b - a)
  ifelse(u < Fc,
         a + sqrt(u * (b - a) * (c - a)),
         b - sqrt((1 - u) * (b - a) * (b - c)))
}

box_muller <- function(n) {
  m <- ceiling(n / 2)
  u1 <- runif(m); u2 <- runif(m)
  r <- sqrt(-2 * log(u1))
  c(r * cos(2 * pi * u2), r * sin(2 * pi * u2))[1:n]
}

# accept-reject for Beta(2, 2) with uniform proposal, max density is 1.5
beta22_rv <- function(n) {
  out <- numeric(0)
  tries <- 0
  while (length(out) < n) {
    y <- runif(1); u <- runif(1)
    tries <- tries + 1
    if (u <= 6 * y * (1 - y) / 1.5) out <- c(out, y)
  }
  attr(out, "acceptance") <- n / tries
  out
}

set.seed(2024)
n <- 5000

e <- exponential_rv(n, 0.5)
c(mean(e), 1 / 0.5)
ks.test(e, "pexp", 0.5)

w <- weibull_rv(n, 2, 3)
ks.test(w, "pweibull", 2, 3)

t <- triangular_rv(n, 1, 4, 10)
c(mean(t), (1 + 4 + 10) / 3)

z <- box_muller(n)
c(mean(z), sd(z))
shapiro.test(z[1:500])

b <- beta22_rv(2000)
attr(b, "acceptance")
ks.test(b, "pbeta", 2, 2)

par(mfrow = c(2, 2))
hist(e, 50, freq = FALSE, main = "Exp(0.5)"); curve(dexp(x, 0.5), add = TRUE, col = 2)
hist(w, 50, freq = FALSE, main = "Weibull(2, 3)"); curve(dweibull(x, 2, 3), add = TRUE, col = 2)
hist(z, 50, freq = FALSE, main = "Box-Muller"); curve(dnorm(x), add = TRUE, col = 2)
hist(b, 30, freq = FALSE, main = "Beta(2, 2)"); curve(dbeta(x, 2, 2), add = TRUE, col = 2)
par(mfrow = c(1, 1))
