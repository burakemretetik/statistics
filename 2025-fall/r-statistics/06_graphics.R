plot(cars, main = "Stopping distance vs speed", xlab = "Speed (mph)", ylab = "Distance (ft)")

plot(cars, type = "n", main = "Stopping distance vs speed")
grid()
points(cars, pch = 19, col = "steelblue")
fit <- lm(dist ~ speed, data = cars)
abline(fit, lwd = 2)

f <- factor(iris$Species)
with(iris, plot(Petal.Length, Petal.Width, pch = as.integer(f), col = as.integer(f)))
legend("topleft", levels(f), pch = 1:3, col = 1:3)

pairs(iris[, 1:4], col = as.integer(iris$Species))

dotchart(VADeaths, main = "Death rates in Virginia (1940)")

plot(AirPassengers, main = "Monthly air passengers", ylab = "passengers")

years <- 2015:2024
enrolled <- c(120, 135, 128, 150, 162, 140, 155, 170, 168, 181)
plot(years, enrolled, type = "b", pch = 16, ylim = c(100, 200))
lines(years, enrolled * 0.6, type = "b", lty = 2)

barplot(VADeaths, beside = TRUE, legend.text = rownames(VADeaths),
        args.legend = list(x = "topleft", cex = 0.8), main = "Death rates by group")

hist(faithful$eruptions, breaks = 20, col = "grey80", main = "Old Faithful eruptions", xlab = "minutes")

boxplot(len ~ supp + dose, data = ToothGrowth, col = c("orange", "lightblue"),
        main = "Tooth length by supplement and dose")

counts <- table(mtcars$cyl)
pie(counts, labels = paste(names(counts), "cyl:", counts))

par(mfrow = c(2, 2))
hist(mtcars$mpg)
boxplot(mtcars$mpg, horizontal = TRUE)
plot(mtcars$wt, mtcars$mpg)
qqnorm(mtcars$mpg); qqline(mtcars$mpg)
par(mfrow = c(1, 1))
