x <- 20
6 -> y
x + y

v <- c(5, 3, 1, 2)
v[2]
v[-1]
v[v > 2]
length(v)
rev(sort(v))

1:12
seq(0, 1, by = 0.25)
rep(c("a", "b"), times = 3)
numeric(5)

m <- matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
m
dim(m)
m[2, ]
m[, 3]
t(m)
m %*% t(m)
rowSums(m)
colMeans(m)
apply(m, 1, max)

a <- matrix(c(2, 1, 1, 3), 2)
solve(a)
det(a)

ages <- c(Ali = 21, Ayse = 23, Can = 20)
ages["Ayse"]
names(ages)[ages > 20]

lst <- list(name = "sample", values = rnorm(5), n = 5)
str(lst)
lst$values

people <- data.frame(
  age = c(21, 23, 20, 25),
  name = c("Ali", "Ayse", "Can", "Deniz"),
  city = c("Izmir", "Ankara", "Izmir", "Bursa")
)
people
str(people)
people$age
people[people$city == "Izmir", ]
mean(people$age)

f <- factor(people$city)
levels(f)
table(f)
