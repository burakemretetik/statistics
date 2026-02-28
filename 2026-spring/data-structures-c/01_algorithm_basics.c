#include <stdio.h>
#include <stdbool.h>
#include <string.h>

int gcd(int a, int b) {
    while (b != 0) {
        int r = a % b;
        a = b;
        b = r;
    }
    return a;
}

bool is_prime(int n) {
    if (n < 2) return false;
    for (int d = 2; d * d <= n; d++)
        if (n % d == 0) return false;
    return true;
}

void sieve(int limit) {
    bool composite[limit + 1];
    memset(composite, 0, sizeof composite);
    for (int i = 2; i * i <= limit; i++)
        if (!composite[i])
            for (int j = i * i; j <= limit; j += i) composite[j] = true;
    for (int i = 2; i <= limit; i++)
        if (!composite[i]) printf("%d ", i);
    printf("\n");
}

int digit_sum(int n) {
    int s = 0;
    for (; n > 0; n /= 10) s += n % 10;
    return s;
}

double power(double x, int n) {
    double result = 1;
    while (n > 0) {
        if (n % 2 == 1) result *= x;
        x *= x;
        n /= 2;
    }
    return result;
}

int main(void) {
    printf("gcd(252, 105) = %d\n", gcd(252, 105));
    printf("lcm(12, 18) = %d\n", 12 / gcd(12, 18) * 18);

    printf("97 prime? %d, 91 prime? %d\n", is_prime(97), is_prime(91));
    sieve(60);

    printf("digit sum of 98765 = %d\n", digit_sum(98765));
    printf("2^30 = %.0f, 1.5^10 = %.4f\n", power(2, 30), power(1.5, 10));

    int a[] = {14, 3, 27, 8, 19, 6};
    int n = sizeof a / sizeof a[0];
    int max = a[0], min = a[0];
    for (int i = 1; i < n; i++) {
        if (a[i] > max) max = a[i];
        if (a[i] < min) min = a[i];
    }
    printf("min %d, max %d\n", min, max);
    return 0;
}
