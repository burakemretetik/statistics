male <- c(12.5, 12.7, 11.8, 12.2, 12.0, 11.9, 12.0, 11.6, 10.9, 12.7, 13.0, 12.3, 12.7, 12.6, 11.8, 11.7, 11.6)
female <- c(11.5, 11.3, 10.9, 10.8, 11.2, 11.8, 12.2, 11.7, 11.6, 10.9, 12.0, 12.0)

var.test(male, female)
t.test(male, female, var.equal = TRUE, alternative = "greater")
t.test(male, female, alternative = "greater")

sp2 <- ((length(male) - 1) * var(male) + (length(female) - 1) * var(female)) /
  (length(male) + length(female) - 2)
t_stat <- (mean(male) - mean(female)) / sqrt(sp2 * (1 / length(male) + 1 / length(female)))
t_stat

boxplot(list(male = male, female = female), ylab = "hemoglobin")

before <- c(82, 76, 90, 68, 74, 88, 79, 85, 71, 80)
after <- c(78, 74, 85, 69, 70, 84, 75, 80, 70, 77)
t.test(before, after, paired = TRUE)
t.test(before - after, mu = 0)

# two proportions: 45/150 vs 30/140
prop.test(c(45, 30), c(150, 140))
prop.test(c(45, 30), c(150, 140), alternative = "greater", correct = FALSE)

t.test(len ~ supp, data = ToothGrowth)
with(ToothGrowth, var.test(len[supp == "OJ"], len[supp == "VC"]))

wilcox.test(male, female, alternative = "greater", exact = FALSE)
