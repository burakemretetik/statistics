#include <iostream>
#include <cmath>
#include <string>
using namespace std;

string letterGrade(double score) {
    if (score >= 90) return "AA";
    if (score >= 85) return "BA";
    if (score >= 80) return "BB";
    if (score >= 75) return "CB";
    if (score >= 70) return "CC";
    if (score >= 60) return "DC";
    if (score >= 50) return "DD";
    return "FF";
}

double electricityBill(double kwh, int type) {
    if (type == 1) return 2 * kwh;
    if (kwh <= 50) return kwh;
    if (kwh <= 100) return 50 + (kwh - 50) * 2;
    return 50 + 100 + (kwh - 100) * 3;
}

int main() {
    int a, b, c;
    cout << "three different numbers: ";
    cin >> a >> b >> c;
    int biggest = a;
    if (b > biggest) biggest = b;
    if (c > biggest) biggest = c;
    cout << "largest: " << biggest << endl;

    int n;
    cout << "number: ";
    cin >> n;
    int root = (int)round(sqrt((double)n));
    if (n > 0 && root * root == n)
        cout << n << " is a perfect square (" << root << "^2)" << endl;
    else
        cout << n << " is not a perfect square" << endl;

    double midterm, final;
    cout << "midterm and final: ";
    cin >> midterm >> final;
    double avg = midterm * 0.4 + final * 0.6;
    cout << "average " << avg << " -> " << letterGrade(avg);
    if (avg >= 60 && final >= 60) cout << " (passed)" << endl;
    else cout << " (failed)" << endl;

    int month;
    cout << "month: ";
    cin >> month;
    switch (month) {
        case 12: case 1: case 2: cout << "winter" << endl; break;
        case 3: case 4: case 5: cout << "spring" << endl; break;
        case 6: case 7: case 8: cout << "summer" << endl; break;
        case 9: case 10: case 11: cout << "autumn" << endl; break;
        default: cout << "invalid month" << endl;
    }

    double first, last;
    int type;
    cout << "first reading, last reading, type (0 home, 1 business): ";
    cin >> first >> last >> type;
    if (last < first || (type != 0 && type != 1)) {
        cout << "invalid input" << endl;
        return 1;
    }
    cout << "bill: " << electricityBill(last - first, type) << " TL" << endl;
    return 0;
}
