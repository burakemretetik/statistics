online <- c(23, 25, 28, 22, 27, 24, 30, 26)
classroom <- c(20, 22, 19, 24, 21, 23, 18)

compare_groups <- function(x, y, alpha = 0.05) {
  normal <- shapiro.test(x)$p.value > alpha && shapiro.test(y)$p.value > alpha
  if (!normal) {
    cat("not normal -> Mann-Whitney U\n")
    return(wilcox.test(x, y, exact = FALSE))
  }
  equal_var <- var.test(x, y)$p.value > alpha
  cat("normal, equal variances:", equal_var, "\n")
  t.test(x, y, var.equal = equal_var)
}
compare_groups(online, classroom)

cohen_d <- function(x, y) {
  sp <- sqrt(((length(x) - 1) * var(x) + (length(y) - 1) * var(y)) / (length(x) + length(y) - 2))
  (mean(x) - mean(y)) / sp
}
cohen_d(online, classroom)

before <- c(80, 75, 90, 85, 70, 95, 88, 72)
after <- c(75, 70, 85, 80, 68, 90, 82, 70)
t.test(before, after, paired = TRUE, alternative = "greater")
d <- before - after
mean(d) / sd(d)

prop.test(c(36, 22), c(80, 75))

# long format
scores <- data.frame(score = c(online, classroom),
                     group = rep(c("online", "classroom"), c(length(online), length(classroom))))
t.test(score ~ group, data = scores)
boxplot(score ~ group, data = scores)

set.seed(3)
skewed_a <- rexp(15, 1 / 10)
skewed_b <- rexp(15, 1 / 18)
compare_groups(skewed_a, skewed_b)
