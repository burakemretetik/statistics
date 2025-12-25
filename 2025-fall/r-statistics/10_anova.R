scores <- data.frame(
  method = factor(rep(c("A", "B", "C", "D"), times = c(6, 7, 6, 6))),
  score = c(62, 70, 68, 75, 66, 71,
            78, 82, 75, 80, 85, 79, 77,
            60, 58, 66, 63, 61, 59,
            72, 74, 70, 76, 69, 75)
)

aggregate(score ~ method, scores, function(x) c(n = length(x), mean = mean(x), sd = sd(x)))
boxplot(score ~ method, scores)

fit <- aov(score ~ method, data = scores)
summary(fit)

bartlett.test(score ~ method, data = scores)

levene <- function(y, g) {
  dev <- abs(y - ave(y, g, FUN = median))
  anova(lm(dev ~ g))
}
levene(scores$score, scores$method)

shapiro.test(residuals(fit))

TukeyHSD(fit)
plot(TukeyHSD(fit))
pairwise.t.test(scores$score, scores$method, p.adjust.method = "bonferroni")

# by hand
grand <- mean(scores$score)
group_means <- tapply(scores$score, scores$method, mean)
n_i <- table(scores$method)
ssb <- sum(n_i * (group_means - grand)^2)
ssw <- sum((scores$score - group_means[scores$method])^2)
k <- nlevels(scores$method); N <- nrow(scores)
F <- (ssb / (k - 1)) / (ssw / (N - k))
c(F = F, p = pf(F, k - 1, N - k, lower.tail = FALSE))

# two-way with interaction
fit2 <- aov(breaks ~ wool * tension, data = warpbreaks)
summary(fit2)
with(warpbreaks, interaction.plot(tension, wool, breaks))
TukeyHSD(fit2, "tension")
