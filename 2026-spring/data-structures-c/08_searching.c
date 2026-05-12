#include <stdio.h>

int comparisons;

int linear_search(const int a[], int n, int key) {
    comparisons = 0;
    for (int i = 0; i < n; i++) {
        comparisons++;
        if (a[i] == key) return i;
    }
    return -1;
}

int binary_search(const int a[], int n, int key) {
    comparisons = 0;
    int lo = 0, hi = n - 1;
    while (lo <= hi) {
        int mid = lo + (hi - lo) / 2;
        comparisons++;
        if (a[mid] == key) return mid;
        if (a[mid] < key) lo = mid + 1;
        else hi = mid - 1;
    }
    return -1;
}

int binary_search_rec(const int a[], int lo, int hi, int key) {
    if (lo > hi) return -1;
    int mid = lo + (hi - lo) / 2;
    if (a[mid] == key) return mid;
    return a[mid] < key ? binary_search_rec(a, mid + 1, hi, key)
                        : binary_search_rec(a, lo, mid - 1, key);
}

int interpolation_search(const int a[], int n, int key) {
    comparisons = 0;
    int lo = 0, hi = n - 1;
    while (lo <= hi && key >= a[lo] && key <= a[hi]) {
        comparisons++;
        if (a[hi] == a[lo]) return a[lo] == key ? lo : -1;
        int pos = lo + (int)((double)(key - a[lo]) * (hi - lo) / (a[hi] - a[lo]));
        if (a[pos] == key) return pos;
        if (a[pos] < key) lo = pos + 1;
        else hi = pos - 1;
    }
    return -1;
}

int main(void) {
    enum { N = 100000 };
    static int a[N];
    for (int i = 0; i < N; i++) a[i] = 3 * i + 1;

    int keys[] = {1, 150001, 299998, 299999, 7};
    printf("%8s %8s %8s %8s %8s\n", "key", "index", "linear", "binary", "interp");
    for (int k = 0; k < 5; k++) {
        int idx = linear_search(a, N, keys[k]);
        int lin = comparisons;
        binary_search(a, N, keys[k]);
        int bin = comparisons;
        interpolation_search(a, N, keys[k]);
        int itp = comparisons;
        printf("%8d %8d %8d %8d %8d\n", keys[k], idx, lin, bin, itp);
    }
    printf("recursive: %d\n", binary_search_rec(a, 0, N - 1, 150001));
    return 0;
}
