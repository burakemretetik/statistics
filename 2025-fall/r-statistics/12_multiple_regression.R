d <- mtcars[, c("mpg", "wt", "hp", "disp", "qsec", "am")]
round(cor(d), 2)
pairs(d[, 1:5])

full <- lm(mpg ~ wt + hp + disp + qsec + am, data = d)
summary(full)
anova(full)

X <- cbind(1, as.matrix(d[, c("wt", "hp", "disp", "qsec", "am")]))
y <- d$mpg
beta <- solve(t(X) %*% X) %*% t(X) %*% y
round(cbind(manual = beta[, 1], lm = coef(full)), 5)

vif <- function(model) {
  X <- model.matrix(model)[, -1]
  sapply(colnames(X), function(v) {
    r2 <- summary(lm(X[, v] ~ X[, colnames(X) != v]))$r.squared
    1 / (1 - r2)
  })
}
round(vif(full), 2)

# disp and hp overlap a lot, drop disp
reduced <- lm(mpg ~ wt + hp + qsec + am, data = d)
anova(reduced, full)

best <- step(full, trace = 0)
summary(best)

AIC(full, reduced, best)

par(mfrow = c(2, 2))
plot(best)
par(mfrow = c(1, 1))

predict(best, data.frame(wt = 2.8, hp = 120, qsec = 18, am = 1, disp = 160), interval = "prediction")

interaction_fit <- lm(mpg ~ wt * am, data = d)
summary(interaction_fit)$coefficients
