#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <string>
#include <vector>
using namespace std;

int main() {
    ofstream out("grades.csv");
    out << "name,midterm,final\n";
    out << "Ali,55,70\nAyse,80,92\nMehmet,40,45\nZeynep,70,58\nCan,90,40\n";
    out.close();

    ifstream in("grades.csv");
    if (!in) {
        cerr << "cannot open file" << endl;
        return 1;
    }

    string line;
    getline(in, line);
    vector<double> averages;

    cout << left << setw(10) << "name" << right << setw(8) << "avg" << endl;
    while (getline(in, line)) {
        stringstream ss(line);
        string name, field;
        double mid, fin;
        getline(ss, name, ',');
        getline(ss, field, ','); mid = stod(field);
        getline(ss, field, ','); fin = stod(field);
        double avg = 0.4 * mid + 0.6 * fin;
        averages.push_back(avg);
        cout << left << setw(10) << name << right << setw(8) << fixed << setprecision(1) << avg << endl;
    }
    in.close();

    double total = 0;
    for (double v : averages) total += v;
    cout << "class mean: " << total / averages.size() << endl;

    ofstream report("report.txt");
    report << "students: " << averages.size() << "\nmean: " << total / averages.size() << "\n";
    report.close();

    string numbers = "4 8 15 16 23 42";
    istringstream is(numbers);
    int x, sum = 0;
    while (is >> x) sum += x;
    cout << "sum from string: " << sum << endl;
    return 0;
}
