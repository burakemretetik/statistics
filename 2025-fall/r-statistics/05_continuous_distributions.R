punif(0.3, 0, 1, lower.tail = FALSE)
dunif(5, 2, 10)
qunif(c(0.25, 0.75), 2, 10)

# waiting time with mean 5 minutes
rate <- 1 / 5
pexp(3, rate)
1 - pexp(10, rate)
qexp(0.5, rate)
# memoryless
(1 - pexp(8, rate)) / (1 - pexp(5, rate))
1 - pexp(3, rate)

mu <- 4; sigma <- 5
pnorm(6, mu, sigma)
1 - pnorm(6, mu, sigma)
pnorm(10, mu, sigma) - pnorm(0, mu, sigma)
qnorm(0.95, mu, sigma)
qnorm(c(0.025, 0.975))

pnorm(1:3) - pnorm(-(1:3))

curve(dnorm(x), -4, 4, lwd = 2, ylab = "density", main = "Normal and t densities")
curve(dt(x, df = 3), add = TRUE, lty = 2)
curve(dt(x, df = 15), add = TRUE, lty = 3)
legend("topright", c("N(0,1)", "t(3)", "t(15)"), lty = 1:3)

x <- seq(-3, 3, length.out = 200)
plot(x, dnorm(x), type = "l")
polygon(c(-3, x[x <= 1.5], 1.5), c(0, dnorm(x[x <= 1.5]), 0), col = "grey85")
text(0, 0.1, round(pnorm(1.5), 4))

pchisq(11.07, df = 5, lower.tail = FALSE)
qchisq(0.95, df = 5)
qf(0.95, 3, 20)
qt(0.975, df = c(5, 10, 30, 100))

set.seed(10)
z <- rnorm(1000, 50, 8)
c(mean(z), sd(z))
hist(z, breaks = 30, freq = FALSE, main = "1000 draws from N(50, 8)")
curve(dnorm(x, 50, 8), add = TRUE, lwd = 2)

# sample means of exponential look normal for n = 30
means <- replicate(2000, mean(rexp(30, rate)))
hist(means, breaks = 40, freq = FALSE)
curve(dnorm(x, 5, 5 / sqrt(30)), add = TRUE, col = "red")
