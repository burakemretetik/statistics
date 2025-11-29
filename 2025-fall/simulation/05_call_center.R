call_center <- function(lambda = 10, capacity = 12, days = 365, hours = 16) {
  calls <- matrix(0, days, hours)
  for (i in 1:days) {
    for (j in 1:hours) {
      u <- runif(1)
      x <- 0; p <- exp(-lambda); F <- p
      while (u >= F) {
        x <- x + 1
        p <- p * lambda / x
        F <- F + p
      }
      calls[i, j] <- x
    }
  }
  lost <- pmax(calls - capacity, 0)
  list(
    avg_lost_per_hour = mean(lost),
    max_calls = max(calls),
    avg_calls = mean(calls),
    share_lost = sum(lost) / sum(calls),
    calls = calls
  )
}

set.seed(10)
res <- call_center()
res[1:4]

# expected lost calls per hour, exact
k <- 13:60
sum((k - 12) * dpois(k, 10))

hist(res$calls, breaks = 0:30, main = "calls per hour", xlab = "calls")
abline(v = 12.5, col = "red", lty = 2)

hourly <- colMeans(res$calls)
plot(hourly, type = "b", ylim = c(8, 12), xlab = "hour of shift", ylab = "mean calls")

for (cap in c(12, 14, 16)) {
  r <- call_center(capacity = cap, days = 100)
  cat("capacity", cap, "-> lost share", round(r$share_lost, 4), "\n")
}
