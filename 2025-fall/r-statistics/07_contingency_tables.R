grades <- c("A", "B", "C", "B", "D", "F", "A", "C", "B", "C", "C", "B", "A", "D", "C")
table(grades)
prop.table(table(grades))
cumsum(table(grades))

survey <- matrix(c(32, 18, 24, 26), nrow = 2,
                 dimnames = list(Gender = c("Female", "Male"), Answer = c("Yes", "No")))
survey
addmargins(survey)
prop.table(survey, margin = 1)

chisq.test(survey)
chisq.test(survey, correct = FALSE)

expected <- outer(rowSums(survey), colSums(survey)) / sum(survey)
expected
x2 <- sum((survey - expected)^2 / expected)
c(x2 = x2, p = pchisq(x2, df = 1, lower.tail = FALSE))

# small cells -> fisher
side_effect <- matrix(c(2, 8, 7, 3), 2,
                      dimnames = list(Drug = c("A", "B"), Effect = c("Yes", "No")))
chisq.test(side_effect)$expected
fisher.test(side_effect)

smoking <- matrix(c(15, 25, 10, 30, 20, 12, 18, 22, 8), nrow = 3, byrow = TRUE,
                  dimnames = list(Title = c("Assistant", "Associate", "Professor"),
                                  Smoking = c("Never", "Sometimes", "Daily")))
res <- chisq.test(smoking)
res
round(res$residuals, 2)

# goodness of fit: is the die fair?
rolls <- c(18, 22, 16, 25, 19, 20)
chisq.test(rolls, p = rep(1 / 6, 6))

tab <- with(mtcars, table(cyl, gear))
tab
summary(tab)
