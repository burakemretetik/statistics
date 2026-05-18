#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

static long long cmp;

static void swap(int *x, int *y) { int t = *x; *x = *y; *y = t; }

void bubble_sort(int a[], int n) {
    for (int i = 0; i < n - 1; i++) {
        int swapped = 0;
        for (int j = 0; j < n - 1 - i; j++) {
            cmp++;
            if (a[j] > a[j + 1]) { swap(&a[j], &a[j + 1]); swapped = 1; }
        }
        if (!swapped) break;
    }
}

void selection_sort(int a[], int n) {
    for (int i = 0; i < n - 1; i++) {
        int m = i;
        for (int j = i + 1; j < n; j++) { cmp++; if (a[j] < a[m]) m = j; }
        swap(&a[i], &a[m]);
    }
}

void insertion_sort(int a[], int n) {
    for (int i = 1; i < n; i++) {
        int key = a[i], j = i - 1;
        while (j >= 0 && (cmp++, a[j] > key)) { a[j + 1] = a[j]; j--; }
        a[j + 1] = key;
    }
}

static void merge(int a[], int tmp[], int lo, int mid, int hi) {
    int i = lo, j = mid, k = lo;
    while (i < mid && j < hi) { cmp++; tmp[k++] = a[i] <= a[j] ? a[i++] : a[j++]; }
    while (i < mid) tmp[k++] = a[i++];
    while (j < hi) tmp[k++] = a[j++];
    memcpy(a + lo, tmp + lo, (hi - lo) * sizeof(int));
}

static void merge_rec(int a[], int tmp[], int lo, int hi) {
    if (hi - lo < 2) return;
    int mid = (lo + hi) / 2;
    merge_rec(a, tmp, lo, mid);
    merge_rec(a, tmp, mid, hi);
    merge(a, tmp, lo, mid, hi);
}

void merge_sort(int a[], int n) {
    int *tmp = malloc(n * sizeof(int));
    merge_rec(a, tmp, 0, n);
    free(tmp);
}

static void quick_rec(int a[], int lo, int hi) {
    if (lo >= hi) return;
    swap(&a[lo + rand() % (hi - lo + 1)], &a[hi]);
    int pivot = a[hi], i = lo;
    for (int j = lo; j < hi; j++) { cmp++; if (a[j] < pivot) swap(&a[i++], &a[j]); }
    swap(&a[i], &a[hi]);
    quick_rec(a, lo, i - 1);
    quick_rec(a, i + 1, hi);
}

void quick_sort(int a[], int n) { quick_rec(a, 0, n - 1); }

static int is_sorted(const int a[], int n) {
    for (int i = 1; i < n; i++) if (a[i - 1] > a[i]) return 0;
    return 1;
}

typedef void (*sorter)(int[], int);

int main(void) {
    const char *names[] = {"bubble", "selection", "insertion", "merge", "quick"};
    sorter fns[] = {bubble_sort, selection_sort, insertion_sort, merge_sort, quick_sort};
    int sizes[] = {1000, 10000};

    srand(7);
    for (int s = 0; s < 2; s++) {
        int n = sizes[s];
        int *base = malloc(n * sizeof(int)), *a = malloc(n * sizeof(int));
        for (int i = 0; i < n; i++) base[i] = rand() % 100000;
        printf("n = %d\n", n);
        for (int f = 0; f < 5; f++) {
            memcpy(a, base, n * sizeof(int));
            cmp = 0;
            clock_t t0 = clock();
            fns[f](a, n);
            double ms = 1000.0 * (clock() - t0) / CLOCKS_PER_SEC;
            printf("  %-10s %12lld comparisons %8.2f ms  %s\n", names[f], cmp, ms, is_sorted(a, n) ? "ok" : "FAIL");
        }
        free(base);
        free(a);
    }

    int small[] = {29, 3, 17, 8, 41, 3, 0, 12};
    insertion_sort(small, 8);
    for (int i = 0; i < 8; i++) printf("%d ", small[i]);
    printf("\n");
    return 0;
}
