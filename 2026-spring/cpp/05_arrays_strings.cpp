#include <iostream>
#include <cstring>
#include <string>
#include <cctype>
using namespace std;

int main() {
    int scores[8] = {72, 45, 88, 91, 60, 77, 88, 53};
    int n = 8;

    int sum = 0, maxIdx = 0;
    for (int i = 0; i < n; i++) {
        sum += scores[i];
        if (scores[i] > scores[maxIdx]) maxIdx = i;
    }
    cout << "mean " << (double)sum / n << ", max " << scores[maxIdx] << " at index " << maxIdx << endl;

    int above = 0;
    for (int i = 0; i < n; i++)
        if (scores[i] > (double)sum / n) above++;
    cout << above << " scores above the mean" << endl;

    int table[3][4];
    for (int i = 0; i < 3; i++)
        for (int j = 0; j < 4; j++)
            table[i][j] = (i + 1) * (j + 1);
    for (int i = 0; i < 3; i++) {
        int rowSum = 0;
        for (int j = 0; j < 4; j++) {
            cout << table[i][j] << '\t';
            rowSum += table[i][j];
        }
        cout << "| " << rowSum << endl;
    }

    char city[30];
    strcpy(city, "Izmir");
    strcat(city, " Bornova");
    cout << city << " has " << strlen(city) << " characters" << endl;
    cout << "strcmp(\"abc\", \"abd\") = " << strcmp("abc", "abd") << endl;

    char word[] = "statistics";
    int vowels = 0;
    for (int i = 0; word[i] != '\0'; i++)
        if (strchr("aeiou", word[i])) vowels++;
    cout << word << ": " << vowels << " vowels" << endl;

    string s = "Data Analysis with C++";
    cout << s.length() << " " << s.substr(5, 8) << " " << s.find("C++") << endl;
    string upper = s;
    for (char& ch : upper) ch = toupper(ch);
    cout << upper << endl;

    string reversed(s.rbegin(), s.rend());
    cout << reversed << endl;

    int words = 1;
    for (char ch : s) if (ch == ' ') words++;
    cout << words << " words" << endl;
    return 0;
}
