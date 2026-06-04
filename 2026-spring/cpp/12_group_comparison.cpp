#include <iostream>
#include <vector>
#include <numeric>
#include <cmath>
using namespace std;

double mean(const vector<double>& v) {
    return accumulate(v.begin(), v.end(), 0.0) / v.size();
}

double var(const vector<double>& v) {
    double m = mean(v), ss = 0;
    for (double x : v) ss += (x - m) * (x - m);
    return ss / (v.size() - 1);
}

int main() {
    vector<double> groupA = {72, 75, 78, 80, 77};
    vector<double> groupB = {65, 70, 68, 72, 69};

    double meanA = mean(groupA), meanB = mean(groupB);
    cout << "group A mean: " << meanA << endl;
    cout << "group B mean: " << meanB << endl;

    if (meanA > meanB) cout << "group A did better" << endl;
    else if (meanB > meanA) cout << "group B did better" << endl;
    else cout << "both groups are equal" << endl;
    cout << "difference: " << meanA - meanB << endl;

    double vA = var(groupA), vB = var(groupB);
    double nA = groupA.size(), nB = groupB.size();
    double se = sqrt(vA / nA + vB / nB);
    double t = (meanA - meanB) / se;
    double df = pow(vA / nA + vB / nB, 2) /
                (pow(vA / nA, 2) / (nA - 1) + pow(vB / nB, 2) / (nB - 1));
    cout << "welch t = " << t << ", df = " << df << endl;

    double sp2 = ((nA - 1) * vA + (nB - 1) * vB) / (nA + nB - 2);
    double tPooled = (meanA - meanB) / sqrt(sp2 * (1 / nA + 1 / nB));
    cout << "pooled t = " << tPooled << " on " << nA + nB - 2 << " df" << endl;
    // t table, df = 8, alpha = 0.05 two-sided
    cout << (fabs(tPooled) > 2.306 ? "significant at 5%" : "not significant at 5%") << endl;
    return 0;
}
