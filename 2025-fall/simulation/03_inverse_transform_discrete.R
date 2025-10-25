discrete_rv <- function(n, values, p) {
  cp <- cumsum(p)
  x <- numeric(n)
  for (i in 1:n) {
    u <- runif(1)
    x[i] <- values[which(u < cp)[1]]
  }
  x
}

discrete_uniform <- function(n, a, b) a + floor((b - a + 1) * runif(n))

bernoulli <- function(n, p) as.numeric(runif(n) < p)

binomial_rv <- function(n, size, p) replicate(n, sum(bernoulli(size, p)))

geometric_rv <- function(n, p) ceiling(log(runif(n)) / log(1 - p))

poisson_rv <- function(n, lambda) {
  x <- numeric(n)
  for (i in 1:n) {
    u <- runif(1)
    k <- 0; pk <- exp(-lambda); F <- pk
    while (u >= F) {
      k <- k + 1
      pk <- pk * lambda / k
      F <- F + pk
    }
    x[i] <- k
  }
  x
}

compare <- function(sim, support, exact) {
  observed <- table(factor(sim, levels = support)) / length(sim)
  round(rbind(simulated = observed, exact = exact), 4)
}

set.seed(1)
n <- 10000

x <- discrete_rv(n, c(1, 2, 3, 4), c(0.20, 0.15, 0.25, 0.40))
compare(x, 1:4, c(0.20, 0.15, 0.25, 0.40))

compare(discrete_uniform(n, 3, 8), 3:8, rep(1 / 6, 6))

b <- binomial_rv(n, 10, 0.3)
compare(b, 0:10, dbinom(0:10, 10, 0.3))
c(mean(b), var(b))

g <- geometric_rv(n, 0.25)
compare(g, 1:10, dgeom(0:9, 0.25))
mean(g)

p <- poisson_rv(n, 3)
compare(p, 0:10, dpois(0:10, 3))
c(mean(p), var(p))

system.time(poisson_rv(n, 3))
system.time(rpois(n, 3))
