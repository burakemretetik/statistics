#include <iostream>
#include <cstdlib>
#include <ctime>
#include <iomanip>
using namespace std;

int rollDie() { return rand() % 6 + 1; }

int main() {
    srand(time(NULL));

    int rolls, target;
    cout << "how many rolls: ";
    cin >> rolls;
    do {
        cout << "which face (1-6): ";
        cin >> target;
    } while (target < 1 || target > 6);

    int freq[7] = {0};
    for (int i = 0; i < rolls; i++) freq[rollDie()]++;

    cout << fixed << setprecision(4);
    for (int f = 1; f <= 6; f++)
        cout << f << ": " << setw(7) << freq[f] << "  " << (double)freq[f] / rolls << endl;
    cout << "P(" << target << ") ~ " << (double)freq[target] / rolls << " (exact " << 1.0 / 6 << ")" << endl;

    int heads = 0;
    for (int i = 0; i < rolls; i++)
        if (rand() % 2 == 0) heads++;
    cout << "P(heads) ~ " << (double)heads / rolls << endl;

    // uniform(0,1) from rand()
    double sum = 0;
    for (int i = 0; i < rolls; i++) sum += (double)rand() / RAND_MAX;
    cout << "mean of U(0,1) ~ " << sum / rolls << endl;

    int doubleSix = 0;
    for (int i = 0; i < rolls; i++)
        if (rollDie() == 6 && rollDie() == 6) doubleSix++;
    cout << "P(double six) ~ " << (double)doubleSix / rolls << " (exact " << 1.0 / 36 << ")" << endl;
    return 0;
}
