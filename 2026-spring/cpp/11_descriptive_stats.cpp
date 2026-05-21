#include <iostream>
#include <vector>
#include <algorithm>
#include <numeric>
#include <cmath>
using namespace std;

int main() {
    int n;
    cout << "how many students: ";
    cin >> n;
    if (n < 2) return 1;

    vector<int> scores(n);
    for (int i = 0; i < n; i++) {
        cout << i + 1 << ". score: ";
        cin >> scores[i];
    }

    double mean = accumulate(scores.begin(), scores.end(), 0.0) / n;

    double variance = 0;
    for (int i = 0; i < n; i++) variance += pow(scores[i] - mean, 2);
    variance /= (n - 1);

    sort(scores.begin(), scores.end());
    double median = n % 2 == 0 ? (scores[n / 2 - 1] + scores[n / 2]) / 2.0 : scores[n / 2];

    int mode = scores[0], best = 0;
    for (int i = 0; i < n; i++) {
        int c = count(scores.begin(), scores.end(), scores[i]);
        if (c > best) {
            best = c;
            mode = scores[i];
        }
    }

    double q1 = scores[(int)round(0.25 * (n - 1))];
    double q3 = scores[(int)round(0.75 * (n - 1))];

    cout << "\nmean     " << mean << endl;
    cout << "variance " << variance << endl;
    cout << "sd       " << sqrt(variance) << endl;
    cout << "median   " << median << endl;
    cout << "mode     " << mode << (best == 1 ? " (no repeated value)" : "") << endl;
    cout << "range    " << scores.back() - scores.front() << endl;
    cout << "q1, q3   " << q1 << ", " << q3 << endl;
    return 0;
}
