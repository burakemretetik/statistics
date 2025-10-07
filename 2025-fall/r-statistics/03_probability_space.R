# loaded die thrown 4 times
faces <- 1:6
p_face <- c(1, 1, 1, 2, 3, 4) / 12

S <- expand.grid(X1 = faces, X2 = faces, X3 = faces, X4 = faces)
S$prob <- p_face[S$X1] * p_face[S$X2] * p_face[S$X3] * p_face[S$X4]
nrow(S)
sum(S$prob)

prob <- function(event) sum(S$prob[event])

all_same <- with(S, X1 == X2 & X2 == X3 & X3 == X4)
S[all_same, ]
prob(all_same)

total <- with(S, X1 + X2 + X3 + X4)
prob(total >= 15)

all_odd <- with(S, X1 %% 2 == 1 & X2 %% 2 == 1 & X3 %% 2 == 1 & X4 %% 2 == 1)
prob(all_odd)

head(subset(S, X2 %% 2 == 0 & X4 %% 2 == 0 & X1 + X3 > 7))
head(subset(S, X1 == 3 & X4 == 3, select = c(X2, X3)))

count_of <- function(value) rowSums(S[, 1:4] == value)
prob(count_of(6) == 2 & total >= 20)
prob(count_of(3) == 2 & count_of(5) == 2)

in_order <- with(S, X1 == 1 & X2 == 2 & X3 == 3 & X4 == 4)
any_order <- apply(S[, 1:4], 1, function(r) all(sort(r) == 1:4))
c(ordered = prob(in_order), unordered = prob(any_order))

# two fair dice
D <- expand.grid(d1 = 1:6, d2 = 1:6)
A <- D$d1 > D$d2
B <- D$d1 %% 2 == 1 | D$d2 %% 2 == 1
pA <- mean(A)
pB <- mean(B)
pAB <- mean(A & B)
c(P_A = pA, P_B = pB, P_B_given_A = pAB / pA, P_A_given_B = pAB / pB)
pAB == pA * pB

set.seed(355)
sims <- replicate(1e5, {
  r <- sample(1:6, 2, replace = TRUE)
  c(r[1] > r[2], any(r %% 2 == 1))
})
mean(sims[2, sims[1, ] == 1])
