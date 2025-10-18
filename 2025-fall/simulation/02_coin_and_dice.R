flip_coin <- function(N, p = 0.5) {
  u <- runif(N)
  ifelse(u < p, "H", "T")
}

throw_die <- function(N, p = rep(1 / 6, 6)) {
  cp <- cumsum(p)
  sapply(runif(N), function(u) which(u < cp)[1])
}

set.seed(42)
coins <- flip_coin(1000)
table(coins) / 1000

running <- cumsum(coins == "H") / seq_along(coins)
plot(running, type = "l", ylim = c(0, 1), xlab = "toss", ylab = "proportion of heads")
abline(h = 0.5, lty = 2)

table(flip_coin(1000, p = 0.7)) / 1000

die <- throw_die(6000)
table(die) / 6000

loaded <- throw_die(6000, p = c(1, 1, 1, 2, 3, 4) / 12)
round(table(loaded) / 6000, 3)

# two dice, distribution of the sum
N <- 10000
s <- throw_die(N) + throw_die(N)
sim <- table(factor(s, levels = 2:12)) / N
exact <- table(outer(1:6, 1:6, "+")) / 36
round(rbind(sim, exact), 4)
barplot(rbind(sim, exact), beside = TRUE, legend.text = c("simulated", "exact"))

# coin and die together: P(H and even)
coin <- flip_coin(N)
d <- throw_die(N)
mean(coin == "H" & d %% 2 == 0)

# coin, six-sided and eight-sided die: P(H and sum of dice > 10)
d8 <- throw_die(N, rep(1 / 8, 8))
mean(coin == "H" & d + d8 > 10)
0.5 * mean(outer(1:6, 1:8, "+") > 10)
