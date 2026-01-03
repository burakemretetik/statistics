hours <- c(2, 4, 5, 7, 8, 10, 11, 13, 14, 16)
exam <- c(48, 55, 52, 63, 66, 70, 74, 79, 82, 88)

cor(hours, exam)
cor.test(hours, exam)

fit <- lm(exam ~ hours)
summary(fit)
coef(fit)
anova(fit)
confint(fit)

b1 <- sum((hours - mean(hours)) * (exam - mean(exam))) / sum((hours - mean(hours))^2)
b0 <- mean(exam) - b1 * mean(hours)
c(b0 = b0, b1 = b1)

plot(hours, exam, pch = 19)
abline(fit, col = "red", lwd = 2)

new <- data.frame(hours = c(6, 12))
predict(fit, new, interval = "confidence")
predict(fit, new, interval = "prediction")

grid_x <- data.frame(hours = seq(0, 18, length.out = 100))
ci <- predict(fit, grid_x, interval = "confidence")
matlines(grid_x$hours, ci[, 2:3], lty = 2, col = "grey40")

par(mfrow = c(2, 2))
plot(fit)
par(mfrow = c(1, 1))

plot(fitted(fit), residuals(fit)); abline(h = 0, lty = 2)
shapiro.test(residuals(fit))

car_fit <- lm(dist ~ speed, data = cars)
summary(car_fit)$r.squared
car_log <- lm(log(dist) ~ speed, data = cars)
summary(car_log)$r.squared
