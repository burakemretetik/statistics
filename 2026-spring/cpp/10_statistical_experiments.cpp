#include <iostream>
#include <random>
#include <vector>
#include <cmath>
#include <iomanip>
using namespace std;

mt19937 rng(328);

double birthdayProblem(int people, int trials) {
    uniform_int_distribution<int> day(0, 364);
    int hits = 0;
    for (int t = 0; t < trials; t++) {
        vector<bool> seen(365, false);
        for (int p = 0; p < people; p++) {
            int d = day(rng);
            if (seen[d]) { hits++; break; }
            seen[d] = true;
        }
    }
    return (double)hits / trials;
}

double monteCarloPi(int n) {
    uniform_real_distribution<double> u(0.0, 1.0);
    int inside = 0;
    for (int i = 0; i < n; i++) {
        double x = u(rng), y = u(rng);
        if (x * x + y * y <= 1) inside++;
    }
    return 4.0 * inside / n;
}

void diceSumHistogram(int dice, int trials) {
    uniform_int_distribution<int> die(1, 6);
    vector<int> freq(6 * dice + 1, 0);
    for (int t = 0; t < trials; t++) {
        int s = 0;
        for (int d = 0; d < dice; d++) s += die(rng);
        freq[s]++;
    }
    for (int s = dice; s <= 6 * dice; s++) {
        cout << setw(3) << s << " ";
        int stars = freq[s] * 300 / trials;
        cout << string(stars, '*') << endl;
    }
}

int main() {
    cout << fixed << setprecision(4);
    for (int k : {10, 23, 40})
        cout << k << " people: P(shared birthday) ~ " << birthdayProblem(k, 20000) << endl;

    for (int n : {1000, 100000, 1000000})
        cout << "pi ~ " << monteCarloPi(n) << " with n=" << n << endl;

    // sum of 5 dice already looks normal
    diceSumHistogram(5, 50000);

    binomial_distribution<int> bin(20, 0.25);
    double s = 0, ss = 0;
    int N = 100000;
    for (int i = 0; i < N; i++) {
        int x = bin(rng);
        s += x;
        ss += x * x;
    }
    double m = s / N;
    cout << "Bin(20, .25): mean " << m << " var " << ss / N - m * m << " (exact 5, 3.75)" << endl;
    return 0;
}
