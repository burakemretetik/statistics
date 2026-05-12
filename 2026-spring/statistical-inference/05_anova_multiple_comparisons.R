dose <- data.frame(
  dose = factor(rep(c("placebo", "low", "mid", "high"), each = 6),
                levels = c("placebo", "low", "mid", "high")),
  response = c(12, 14, 11, 15, 13, 12,
               15, 17, 16, 14, 18, 16,
               19, 18, 21, 20, 17, 22,
               23, 21, 25, 22, 24, 26)
)

tapply(dose$response, dose$dose, mean)
bartlett.test(response ~ dose, data = dose)
fit <- aov(response ~ dose, data = dose)
summary(fit)
oneway.test(response ~ dose, data = dose)

TukeyHSD(fit)
pairwise.t.test(dose$response, dose$dose, p.adjust.method = "bonferroni")
pairwise.t.test(dose$response, dose$dose, p.adjust.method = "holm")

scheffe <- function(y, g, alpha = 0.05) {
  k <- nlevels(g); N <- length(y)
  means <- tapply(y, g, mean); n <- tapply(y, g, length)
  mse <- sum((y - means[g])^2) / (N - k)
  pairs <- combn(levels(g), 2)
  out <- t(apply(pairs, 2, function(p) {
    diff <- means[p[1]] - means[p[2]]
    F <- diff^2 / (mse * (1 / n[p[1]] + 1 / n[p[2]])) / (k - 1)
    c(diff = unname(diff), F = unname(F), p = pf(F, k - 1, N - k, lower.tail = FALSE))
  }))
  rownames(out) <- apply(pairs, 2, paste, collapse = "-")
  round(out, 4)
}
scheffe(dose$response, dose$dose)

# every treatment against placebo
ctrl <- dose$response[dose$dose == "placebo"]
sapply(c("low", "mid", "high"), function(l) t.test(dose$response[dose$dose == l], ctrl)$p.value) * 3

# why not many t-tests: chance of at least one false alarm
k <- 4
m <- choose(k, 2)
1 - (1 - 0.05)^m
