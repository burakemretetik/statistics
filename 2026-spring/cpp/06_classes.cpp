#include <iostream>
#include <vector>
#include <cmath>
#include <string>
using namespace std;

class Sample {
private:
    string name;
    vector<double> values;

public:
    Sample(const string& n) : name(n) {}
    Sample(const string& n, const vector<double>& v) : name(n), values(v) {}

    void add(double x) { values.push_back(x); }
    int size() const { return (int)values.size(); }

    double mean() const {
        double s = 0;
        for (double x : values) s += x;
        return s / values.size();
    }

    double sd() const {
        double m = mean(), ss = 0;
        for (double x : values) ss += (x - m) * (x - m);
        return sqrt(ss / (values.size() - 1));
    }

    double standardError() const { return sd() / sqrt((double)size()); }

    void print() const {
        cout << name << ": n=" << size() << " mean=" << mean() << " sd=" << sd()
             << " se=" << standardError() << endl;
    }
};

class Rectangle {
    double w, h;
public:
    Rectangle(double width = 1, double height = 1) : w(width), h(height) {}
    double area() const { return w * h; }
    double perimeter() const { return 2 * (w + h); }
    bool isSquare() const { return w == h; }
};

class Account {
    string owner;
    double balance = 0;
public:
    explicit Account(string o) : owner(o) {}
    void deposit(double amount) { if (amount > 0) balance += amount; }
    bool withdraw(double amount) {
        if (amount > balance) return false;
        balance -= amount;
        return true;
    }
    double getBalance() const { return balance; }
};

int main() {
    Sample a("group A", {72, 75, 78, 80, 77});
    Sample b("group B");
    for (double x : {65, 70, 68, 72, 69, 71}) b.add(x);
    a.print();
    b.print();

    Rectangle r1(3, 4), r2(5, 5), r3;
    cout << r1.area() << " " << r1.perimeter() << " " << r2.isSquare() << " " << r3.area() << endl;

    Account acc("Burak");
    acc.deposit(500);
    cout << (acc.withdraw(800) ? "ok" : "insufficient funds") << endl;
    acc.withdraw(120);
    cout << "balance: " << acc.getBalance() << endl;
    return 0;
}
