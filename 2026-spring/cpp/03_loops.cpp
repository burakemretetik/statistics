#include <iostream>
#include <cmath>
using namespace std;

int main() {
    int evenSum = 0;
    for (int i = 0; i <= 24; i += 2) evenSum += i;
    cout << "sum of evens 0..24: " << evenSum << endl;

    double x, total = 0;
    int count = 0;
    cout << "numbers (0 ends): ";
    cin >> x;
    while (x != 0) {
        total += x;
        count++;
        cin >> x;
    }
    if (count > 0) cout << "mean of " << count << " numbers: " << total / count << endl;

    int choice;
    do {
        cout << "\n1 sqrt  2 power  3 ln  4 log10  0 quit: ";
        cin >> choice;
        double v, p;
        switch (choice) {
            case 1: cin >> v; cout << sqrt(v) << endl; break;
            case 2: cin >> v >> p; cout << pow(v, p) << endl; break;
            case 3: cin >> v; cout << log(v) << endl; break;
            case 4: cin >> v; cout << log10(v) << endl; break;
            case 0: break;
            default: cout << "unknown option" << endl;
        }
    } while (choice != 0);

    for (int i = 1; i <= 5; i++) {
        for (int j = 0; j < 5 - i; j++) cout << ' ';
        for (int j = 0; j < 2 * i - 1; j++) cout << '*';
        cout << endl;
    }

    long long fact = 1;
    for (int k = 1; k <= 20; k++) {
        fact *= k;
        if (k % 5 == 0) cout << k << "! = " << fact << endl;
    }

    int n = 1;
    while (n * n < 500) n++;
    cout << "smallest n with n^2 >= 500: " << n << endl;
    return 0;
}
