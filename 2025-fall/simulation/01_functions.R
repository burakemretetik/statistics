matrix_report <- function(A) {
  if (nrow(A) != ncol(A)) stop("matrix is not square")
  n <- nrow(A)

  d <- diag(A)
  cat("main diagonal mean:", mean(d), " median:", median(d),
      " var:", var(d), " cv:", sd(d) / mean(d), "\n")

  anti <- A[cbind(1:n, n:1)]
  cat("secondary diagonal min/max:", min(anti), max(anti), "\n")

  cat("odd:", sum(A %% 2 == 1), " even (non-zero):", sum(A %% 2 == 0 & A != 0),
      " zero:", sum(A == 0), "\n")
  cat("matrix mean:", mean(A), " median:", median(A), "\n")
}

# same diagonal stats without built-ins
diag_stats <- function(A) {
  n <- nrow(A)
  t <- 0; sq <- 0; d <- numeric(n)
  for (i in 1:n) {
    t <- t + A[i, i]
    sq <- sq + A[i, i]^2
    d[i] <- A[i, i]
  }
  for (i in 1:(n - 1)) {
    for (j in (i + 1):n) {
      if (d[i] > d[j]) {
        tmp <- d[i]; d[i] <- d[j]; d[j] <- tmp
      }
    }
  }
  med <- if (n %% 2 == 0) (d[n / 2] + d[n / 2 + 1]) / 2 else d[(n + 1) / 2]
  c(mean = t / n, var = (sq - t^2 / n) / (n - 1), median = med)
}

bookstore <- function(sales, price) {
  revenue <- sweep(sales, 2, price, "*")
  cat("total copies per book:", colSums(sales), "\n")
  cat("revenue per book:", colSums(revenue), "\n")
  best_day <- which.max(rowSums(revenue))
  cat("best day:", best_day, "with", sum(revenue[best_day, ]), "TL\n")
  invisible(revenue)
}

piecewise <- function(x) {
  y <- x^2
  mid <- x >= 0 & x <= 2
  y[mid] <- 2 * x[mid] + 1
  y[x > 2] <- log(x[x > 2]) + 4
  y
}

A <- matrix(c(4, 7, 0, 3,
              2, 9, 5, 8,
              1, 0, 6, 11,
              3, 12, 7, 5), 4, byrow = TRUE)
matrix_report(A)
diag_stats(A)
try(matrix_report(matrix(1:6, 2)))

set.seed(309)
sales <- matrix(rpois(30 * 3, c(4, 7, 2)), ncol = 3, byrow = TRUE)
bookstore(sales, price = c(250, 180, 320))

curve(piecewise, -3, 6, n = 400)
