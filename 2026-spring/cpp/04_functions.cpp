#include <iostream>
#include <cmath>
using namespace std;

int calls = 0;

double mean(const double a[], int n) {
    calls++;
    double s = 0;
    for (int i = 0; i < n; i++) s += a[i];
    return s / n;
}

double variance(const double a[], int n, bool sample = true) {
    double m = mean(a, n), ss = 0;
    for (int i = 0; i < n; i++) ss += (a[i] - m) * (a[i] - m);
    return ss / (sample ? n - 1 : n);
}

void swapValues(int& x, int& y) {
    int t = x;
    x = y;
    y = t;
}

void minMax(const double a[], int n, double& lo, double& hi) {
    lo = hi = a[0];
    for (int i = 1; i < n; i++) {
        if (a[i] < lo) lo = a[i];
        if (a[i] > hi) hi = a[i];
    }
}

int maxOf(int a, int b) { return a > b ? a : b; }
double maxOf(double a, double b) { return a > b ? a : b; }

long long factorial(int n) { return n <= 1 ? 1 : n * factorial(n - 1); }

long long combination(int n, int r) {
    long long c = 1;
    for (int i = 1; i <= r; i++) c = c * (n - r + i) / i;
    return c;
}

double binomialPmf(int k, int n, double p) {
    return combination(n, k) * pow(p, k) * pow(1 - p, n - k);
}

int gcd(int a, int b) { return b == 0 ? a : gcd(b, a % b); }

int main() {
    double data[] = {12.5, 9.8, 15.1, 11.0, 13.7, 10.4};
    int n = sizeof(data) / sizeof(data[0]);

    cout << "mean " << mean(data, n) << endl;
    cout << "sample var " << variance(data, n) << ", population var " << variance(data, n, false) << endl;

    double lo, hi;
    minMax(data, n, lo, hi);
    cout << "range " << lo << " - " << hi << endl;

    int a = 3, b = 8;
    swapValues(a, b);
    cout << a << " " << b << endl;

    cout << maxOf(4, 9) << " " << maxOf(2.5, 1.5) << endl;
    cout << "10! = " << factorial(10) << ", C(10,3) = " << combination(10, 3) << endl;

    double total = 0;
    for (int k = 0; k <= 10; k++) total += binomialPmf(k, 10, 0.3);
    cout << "P(X=3) = " << binomialPmf(3, 10, 0.3) << ", sum of pmf = " << total << endl;

    cout << "gcd(84, 36) = " << gcd(84, 36) << endl;
    cout << "mean() was called " << calls << " times" << endl;
    return 0;
}
