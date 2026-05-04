#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#define CAP 8

typedef struct {
    int items[CAP];
    int front, rear, count;
} Queue;

void init(Queue *q) { q->front = 0; q->rear = -1; q->count = 0; }
bool is_empty(const Queue *q) { return q->count == 0; }
bool is_full(const Queue *q) { return q->count == CAP; }

bool enqueue(Queue *q, int x) {
    if (is_full(q)) return false;
    q->rear = (q->rear + 1) % CAP;
    q->items[q->rear] = x;
    q->count++;
    return true;
}

int dequeue(Queue *q) {
    int x = q->items[q->front];
    q->front = (q->front + 1) % CAP;
    q->count--;
    return x;
}

typedef struct QNode {
    int value;
    struct QNode *next;
} QNode;

typedef struct {
    QNode *head, *tail;
} LinkedQueue;

void lq_push(LinkedQueue *q, int v) {
    QNode *n = malloc(sizeof(QNode));
    n->value = v;
    n->next = NULL;
    if (q->tail) q->tail->next = n;
    else q->head = n;
    q->tail = n;
}

int lq_pop(LinkedQueue *q) {
    QNode *n = q->head;
    int v = n->value;
    q->head = n->next;
    if (!q->head) q->tail = NULL;
    free(n);
    return v;
}

// single teller, a customer arrives with prob 0.3 each minute, service takes 1-5 minutes
void bank_simulation(int minutes) {
    LinkedQueue q = {NULL, NULL};
    int busy_until = 0, served = 0, total_wait = 0, max_len = 0, len = 0;
    srand(42);
    for (int t = 0; t < minutes; t++) {
        if (rand() % 100 < 30) {
            lq_push(&q, t);
            len++;
        }
        if (len > max_len) max_len = len;
        if (t >= busy_until && q.head) {
            int arrived = lq_pop(&q);
            len--;
            total_wait += t - arrived;
            served++;
            busy_until = t + 1 + rand() % 5;
        }
    }
    while (q.head) lq_pop(&q);
    printf("served %d, mean wait %.2f min, longest queue %d\n",
           served, (double)total_wait / served, max_len);
}

int main(void) {
    Queue q;
    init(&q);
    for (int i = 1; i <= 10; i++)
        if (!enqueue(&q, i)) printf("queue full, %d rejected\n", i);
    for (int i = 0; i < 3; i++) printf("dequeued %d\n", dequeue(&q));
    enqueue(&q, 11);
    enqueue(&q, 12);
    printf("front index %d, rear index %d, count %d\n", q.front, q.rear, q.count);
    while (!is_empty(&q)) printf("%d ", dequeue(&q));
    printf("\n");

    bank_simulation(480);
    return 0;
}
