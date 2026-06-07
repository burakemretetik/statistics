#include <stdio.h>
#include <limits.h>
#include <stdbool.h>

#define V 7

const char *city[V] = {"Izmir", "Manisa", "Aydin", "Denizli", "Usak", "Mugla", "Afyon"};

int w[V][V] = {
    /*        Izm Man Ayd Den Usa Mug Afy */
    /* Izm */ {0,  40, 130, 0,  0,  0,   0},
    /* Man */ {40, 0,  0,   0,  160, 0,  0},
    /* Ayd */ {130, 0, 0,   125, 0,  100, 0},
    /* Den */ {0,  0,  125, 0,  150, 145, 220},
    /* Usa */ {0,  160, 0,  150, 0,  0,  115},
    /* Mug */ {0,  0,  100, 145, 0,  0,  0},
    /* Afy */ {0,  0,  0,   220, 115, 0, 0},
};

void bfs(int start) {
    bool seen[V] = {false};
    int queue[V], head = 0, tail = 0, level[V];
    queue[tail++] = start;
    seen[start] = true;
    level[start] = 0;
    printf("BFS: ");
    while (head < tail) {
        int u = queue[head++];
        printf("%s(%d) ", city[u], level[u]);
        for (int v = 0; v < V; v++)
            if (w[u][v] && !seen[v]) {
                seen[v] = true;
                level[v] = level[u] + 1;
                queue[tail++] = v;
            }
    }
    printf("\n");
}

void dfs(int u, bool seen[]) {
    seen[u] = true;
    printf("%s ", city[u]);
    for (int v = 0; v < V; v++)
        if (w[u][v] && !seen[v]) dfs(v, seen);
}

void dijkstra(int src) {
    int dist[V], prev[V];
    bool done[V] = {false};
    for (int i = 0; i < V; i++) { dist[i] = INT_MAX; prev[i] = -1; }
    dist[src] = 0;

    for (int k = 0; k < V; k++) {
        int u = -1;
        for (int i = 0; i < V; i++)
            if (!done[i] && dist[i] != INT_MAX && (u == -1 || dist[i] < dist[u])) u = i;
        if (u == -1) break;
        done[u] = true;
        for (int v = 0; v < V; v++)
            if (w[u][v] && dist[u] + w[u][v] < dist[v]) {
                dist[v] = dist[u] + w[u][v];
                prev[v] = u;
            }
    }

    for (int v = 0; v < V; v++) {
        int path[V], len = 0;
        for (int p = v; p != -1; p = prev[p]) path[len++] = p;
        printf("%-8s %4d km  ", city[v], dist[v]);
        for (int i = len - 1; i >= 0; i--) printf("%s%s", city[path[i]], i ? " > " : "\n");
    }
}

int main(void) {
    int edges = 0;
    for (int i = 0; i < V; i++) {
        int degree = 0;
        for (int j = 0; j < V; j++) if (w[i][j]) degree++;
        edges += degree;
        printf("%-8s degree %d\n", city[i], degree);
    }
    printf("%d edges\n", edges / 2);

    bfs(0);
    bool seen[V] = {false};
    printf("DFS: ");
    dfs(0, seen);
    printf("\n");

    dijkstra(0);
    return 0;
}
