recovery <- list(
  drug_a = c(12, 15, 9, 20, 14, 31),
  drug_b = c(8, 7, 11, 6, 10),
  drug_c = c(18, 22, 16, 25, 19, 21, 40)
)
sapply(recovery, function(x) shapiro.test(x)$p.value)

y <- unlist(recovery)
g <- factor(rep(names(recovery), lengths(recovery)))

kruskal.test(y ~ g)

r <- rank(y)
n_i <- tapply(r, g, length)
R_i <- tapply(r, g, sum)
N <- length(y)
H <- 12 / (N * (N + 1)) * sum(R_i^2 / n_i) - 3 * (N + 1)
c(H = H, p = pchisq(H, nlevels(g) - 1, lower.tail = FALSE))

pairwise.wilcox.test(y, g, p.adjust.method = "holm", exact = FALSE)

boxplot(y ~ g, ylab = "days to recover")

kruskal.test(Ozone ~ Month, data = airquality)

# friedman for repeated measures: 6 judges, 3 products
ratings <- matrix(c(7, 5, 6,
                    8, 6, 7,
                    6, 6, 5,
                    9, 7, 8,
                    7, 4, 6,
                    8, 5, 7), ncol = 3, byrow = TRUE,
                  dimnames = list(NULL, c("P1", "P2", "P3")))
friedman.test(ratings)
