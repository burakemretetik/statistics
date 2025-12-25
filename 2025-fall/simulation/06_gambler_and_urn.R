gambler <- function(p, start = 200, bet = 100, target = 500) {
  money <- start
  path <- money
  while (money > 0 && money < target) {
    money <- money + if (runif(1) < p) bet else -bet
    path <- c(path, money)
  }
  path
}

set.seed(7)
path <- gambler(0.45)
plot(seq_along(path) - 1, path, type = "s", xlab = "game", ylab = "TL", main = "Gambler's money")
abline(h = c(0, 500), lty = 2)

win_prob <- function(p, runs = 5000) mean(replicate(runs, tail(gambler(p), 1) == 500))
for (p in c(0.4, 0.45, 0.5, 0.55)) {
  r <- (1 - p) / p
  exact <- if (p == 0.5) 2 / 5 else (1 - r^2) / (1 - r^5)
  cat(sprintf("p = %.2f  simulated %.3f  exact %.3f\n", p, win_prob(p), exact))
}

# urn with 2 balls: paint unpainted ones by coin, flip color of painted ones
urn <- function(N) {
  state <- c(unpainted = 2, red = 0, black = 0)
  history <- matrix(0, N + 1, 3, dimnames = list(NULL, names(state)))
  history[1, ] <- state
  for (t in 1:N) {
    balls <- rep(names(state), state)
    chosen <- balls[sample(2, 1)]
    heads <- runif(1) < 0.5
    if (chosen == "unpainted") {
      new <- if (heads) "red" else "black"
    } else {
      new <- if (chosen == "red") "black" else "red"
    }
    state[chosen] <- state[chosen] - 1
    state[new] <- state[new] + 1
    history[t + 1, ] <- state
  }
  history
}

h <- urn(20)
h
matplot(0:20, h, type = "s", lty = 1, col = 1:3, ylab = "balls", xlab = "step")
legend("right", colnames(h), col = 1:3, lty = 1)

finals <- t(replicate(5000, urn(10)[11, ]))
table(paste0("R", finals[, "red"], "-B", finals[, "black"])) / 5000
