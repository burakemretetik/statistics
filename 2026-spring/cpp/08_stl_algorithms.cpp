#include <iostream>
#include <vector>
#include <algorithm>
#include <numeric>
#include <string>
using namespace std;

void print(const string& label, const vector<int>& v) {
    cout << label << ": ";
    for (int x : v) cout << x << ' ';
    cout << endl;
}

int main() {
    vector<int> v = {48, 25, 25, 43, 81, 81, 25, 90, 25, 85};
    print("data", v);

    cout << "count of 25: " << count(v.begin(), v.end(), 25) << endl;
    cout << "greater than 50: " << count_if(v.begin(), v.end(), [](int x) { return x > 50; }) << endl;

    auto it = find(v.begin(), v.end(), 81);
    if (it != v.end()) cout << "81 first at index " << it - v.begin() << endl;

    vector<int> pattern = {81, 25};
    auto pos = search(v.begin(), v.end(), pattern.begin(), pattern.end());
    cout << "pattern 81 25 at index " << pos - v.begin() << endl;

    vector<int> doubled(v.size());
    transform(v.begin(), v.end(), doubled.begin(), [](int x) { return 2 * x; });
    print("doubled", doubled);

    vector<int> sorted = v;
    sort(sorted.begin(), sorted.end());
    print("sorted", sorted);
    sort(sorted.begin(), sorted.end(), greater<int>());
    print("desc", sorted);

    cout << "sum " << accumulate(v.begin(), v.end(), 0) << endl;
    cout << "min " << *min_element(v.begin(), v.end()) << ", max " << *max_element(v.begin(), v.end()) << endl;

    vector<int> unique_vals = v;
    sort(unique_vals.begin(), unique_vals.end());
    unique_vals.erase(unique(unique_vals.begin(), unique_vals.end()), unique_vals.end());
    print("unique", unique_vals);

    cout << "binary search 43: " << binary_search(unique_vals.begin(), unique_vals.end(), 43) << endl;

    vector<int> a = {1, 4, 7}, b = {2, 3, 9}, merged(6);
    merge(a.begin(), a.end(), b.begin(), b.end(), merged.begin());
    print("merged", merged);

    vector<int> filled(5);
    fill(filled.begin(), filled.end(), 7);
    print("filled", filled);
    cout << "equal: " << equal(a.begin(), a.end(), b.begin()) << endl;

    string text = "mississippi";
    cout << "s appears " << count(text.begin(), text.end(), 's') << " times" << endl;
    reverse(text.begin(), text.end());
    cout << text << endl;
    return 0;
}
