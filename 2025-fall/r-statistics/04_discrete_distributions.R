# binomial: 10 games, p = 0.3 of winning each
n <- 10; p <- 0.3
x <- 0:n
round(dbinom(x, n, p), 4)
dbinom(3, n, p)
pbinom(3, n, p)
1 - pbinom(5, n, p)
pbinom(5, n, p, lower.tail = FALSE)
qbinom(0.9, n, p)
c(mean = n * p, var = n * p * (1 - p))

par(mfrow = c(1, 2))
plot(x, dbinom(x, n, p), type = "h", lwd = 3, main = "Bin(10, 0.3)", ylab = "P(X = x)")
plot(stepfun(x, c(0, pbinom(x, n, p))), main = "CDF", verticals = FALSE)
par(mfrow = c(1, 1))

# poisson: 4 calls per hour on average
lambda <- 4
dpois(0:10, lambda)
ppois(2, lambda)
1 - ppois(6, lambda)
dpois(12, lambda * 3)

# geometric: number of failures before first success
dgeom(0:5, 0.2)
pgeom(3, 0.2)

# hypergeometric: 5 defective in 20, draw 4
dhyper(0:4, m = 5, n = 15, k = 4)
1 - phyper(0, 5, 15, 4)

# negative binomial: failures before 3rd success
dnbinom(0:6, size = 3, prob = 0.4)

set.seed(1)
sim <- rbinom(10000, n, p)
rbind(simulated = round(prop.table(table(factor(sim, levels = x))), 4),
      exact = round(dbinom(x, n, p), 4))
c(mean(sim), var(sim))

# poisson approx to binomial when n large, p small
k <- 0:8
round(cbind(binom = dbinom(k, 500, 0.008), pois = dpois(k, 4)), 4)
