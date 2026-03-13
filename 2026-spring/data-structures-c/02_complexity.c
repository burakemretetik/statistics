#include <stdio.h>
#include <time.h>

long long linear(int n) {
    long long ops = 0;
    for (int i = 0; i < n; i++) ops++;
    return ops;
}

long long quadratic(int n) {
    long long ops = 0;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++) ops++;
    return ops;
}

long long triangular(int n) {
    long long ops = 0;
    for (int i = 0; i < n; i++)
        for (int j = i + 1; j < n; j++) ops++;
    return ops;
}

long long logarithmic(int n) {
    long long ops = 0;
    for (int i = n; i > 1; i /= 2) ops++;
    return ops;
}

long long fib_calls = 0;

long long fib_naive(int n) {
    fib_calls++;
    return n < 2 ? n : fib_naive(n - 1) + fib_naive(n - 2);
}

long long fib_iter(int n) {
    long long a = 0, b = 1;
    for (int i = 0; i < n; i++) {
        long long t = a + b;
        a = b;
        b = t;
    }
    return a;
}

int main(void) {
    printf("%8s %10s %14s %14s %8s\n", "n", "O(n)", "O(n^2)", "n(n-1)/2", "O(log n)");
    for (int n = 10; n <= 100000; n *= 10)
        printf("%8d %10lld %14lld %14lld %8lld\n", n, linear(n), quadratic(n), triangular(n), logarithmic(n));

    for (int n = 20; n <= 35; n += 5) {
        fib_calls = 0;
        clock_t t0 = clock();
        long long f = fib_naive(n);
        double ms = 1000.0 * (clock() - t0) / CLOCKS_PER_SEC;
        printf("fib(%d) = %lld, %lld calls, %.1f ms\n", n, f, fib_calls, ms);
    }
    printf("fib(90) iterative = %lld\n", fib_iter(90));
    return 0;
}
