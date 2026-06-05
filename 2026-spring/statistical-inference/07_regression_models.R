ads <- c(5, 7, 8, 10, 12, 14, 15, 17, 19, 20)
sales <- c(41, 46, 47, 53, 54, 60, 61, 66, 67, 73)
m1 <- lm(sales ~ ads)
summary(m1)
predict(m1, data.frame(ads = 16), interval = "prediction")

set.seed(22)
n <- 60
study <- round(runif(n, 1, 15))
absence <- rpois(n, 4)
sleep <- round(rnorm(n, 7, 1), 1)
score <- 40 + 3 * study - 1.5 * absence + 1.2 * sleep + rnorm(n, 0, 5)
students <- data.frame(study, absence, sleep, score)

m2 <- lm(score ~ study + absence + sleep, data = students)
summary(m2)
confint(m2)
predict(m2, data.frame(study = 9, absence = 2, sleep = 7), interval = "confidence")

par(mfrow = c(1, 2))
plot(fitted(m2), residuals(m2)); abline(h = 0, lty = 2)
qqnorm(residuals(m2)); qqline(residuals(m2))
par(mfrow = c(1, 1))

# logistic: pass/fail
students$passed <- as.integer(students$score > 65)
table(students$passed)
m3 <- glm(passed ~ study + absence, data = students, family = binomial)
summary(m3)
exp(coef(m3))
exp(confint.default(m3))

new <- data.frame(study = c(4, 8, 12), absence = 3)
predict(m3, new, type = "response")

pred <- as.integer(fitted(m3) > 0.5)
conf <- table(predicted = pred, actual = students$passed)
conf
sum(diag(conf)) / sum(conf)

s <- seq(0, 16, by = 0.1)
plot(students$study, students$passed, pch = 19, col = "grey50", xlab = "study hours", ylab = "P(pass)")
lines(s, predict(m3, data.frame(study = s, absence = 3), type = "response"))
lines(s, predict(m3, data.frame(study = s, absence = 8), type = "response"), lty = 2)
legend("topleft", c("3 absences", "8 absences"), lty = 1:2)
