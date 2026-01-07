random_walk <- function(N) {
  steps <- matrix(c(0, 1, 0, -1, 1, 0, -1, 0), ncol = 2, byrow = TRUE,
                  dimnames = list(c("N", "S", "E", "W"), c("x", "y")))
  moves <- steps[sample(4, N, replace = TRUE), , drop = FALSE]
  rbind(c(0, 0), apply(moves, 2, cumsum))
}

set.seed(100)
path <- random_walk(200)
path[nrow(path), ]
plot(path, type = "l", asp = 1, main = "200 steps")
points(0, 0, pch = 19, col = "green")
points(path[nrow(path), , drop = FALSE], pch = 19, col = "red")

end_distance <- function(N) {
  p <- random_walk(N)[N + 1, ]
  sqrt(sum(p^2))
}

Ns <- c(10, 50, 100, 400, 1000)
mean_dist <- sapply(Ns, function(N) mean(replicate(1000, end_distance(N))))
cbind(N = Ns, mean_distance = round(mean_dist, 2), sqrt_N = round(sqrt(Ns), 2))
# grows like sqrt(N)

back_home <- function(N) {
  p <- random_walk(N)[-1, ]
  any(p[, 1] == 0 & p[, 2] == 0)
}
mean(replicate(2000, back_home(100)))
