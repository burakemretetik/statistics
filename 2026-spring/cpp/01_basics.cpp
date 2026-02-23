#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    cout << "Hello C++" << endl;

    int a, b;
    cout << "Enter two integers: ";
    cin >> a >> b;

    cout << "difference: " << a - b << endl;
    cout << "product:    " << a * b << endl;
    cout << "a / b:      " << a / b << " remainder " << a % b << endl;
    cout << fixed << setprecision(2);
    cout << "average:    " << (a + b) / 2.0 << endl;

    const double PI = 3.14159265;
    double r;
    cout << "radius: ";
    cin >> r;
    cout << "area " << PI * r * r << ", circumference " << 2 * PI * r << endl;

    cout << "int " << sizeof(int) << " bytes, double " << sizeof(double)
         << " bytes, char " << sizeof(char) << " byte" << endl;

    int x = 5;
    int post = x++;
    cout << post << " " << x << endl;
    int pre = ++x;
    cout << pre << " " << x << endl;

    char c = 'A';
    cout << c << " = " << int(c) << ", next: " << char(c + 1) << endl;
    return 0;
}
