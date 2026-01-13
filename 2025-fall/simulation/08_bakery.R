demand_levels <- seq(36, 96, by = 12)
demand_probs <- cbind(
  high    = c(0.05, 0.10, 0.25, 0.30, 0.20, 0.10),
  average = c(0.10, 0.20, 0.30, 0.25, 0.10, 0.05),
  low     = c(0.15, 0.25, 0.35, 0.15, 0.05, 0.05)
)
category_probs <- c(high = 0.30, average = 0.45, low = 0.25)

price <- 60; cost <- 30; salvage <- 10; shortage <- 15

daily_demand <- function(N) {
  cat_cp <- cumsum(category_probs)
  d <- numeric(N)
  for (i in 1:N) {
    k <- which(runif(1) < cat_cp)[1]
    cp <- cumsum(demand_probs[, k])
    d[i] <- demand_levels[which(runif(1) < cp)[1]]
  }
  d
}

profit <- function(baked, demand) {
  sold <- pmin(baked, demand)
  price * sold + salvage * (baked - sold) - cost * baked - shortage * pmax(demand - baked, 0)
}

set.seed(2025)
N <- 365
demand <- daily_demand(N)
table(demand) / N

results <- sapply(demand_levels, function(b) mean(profit(b, demand)))
names(results) <- demand_levels
round(results, 1)
best <- demand_levels[which.max(results)]
best

# same demand days for every option, so the comparison is fair
plot(demand_levels, results, type = "b", pch = 19, xlab = "loaves baked", ylab = "mean daily profit")
abline(v = best, lty = 2)

reps <- replicate(200, {
  d <- daily_demand(100)
  demand_levels[which.max(sapply(demand_levels, function(b) mean(profit(b, d))))]
})
table(reps)
