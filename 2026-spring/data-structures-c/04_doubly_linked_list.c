#include <stdio.h>
#include <stdlib.h>

typedef struct DNode {
    int data;
    struct DNode *prev, *next;
} DNode;

typedef struct {
    DNode *head, *tail;
    int size;
} DList;

void append(DList *l, int value) {
    DNode *n = malloc(sizeof(DNode));
    n->data = value;
    n->next = NULL;
    n->prev = l->tail;
    if (l->tail) l->tail->next = n;
    else l->head = n;
    l->tail = n;
    l->size++;
}

void prepend(DList *l, int value) {
    DNode *n = malloc(sizeof(DNode));
    n->data = value;
    n->prev = NULL;
    n->next = l->head;
    if (l->head) l->head->prev = n;
    else l->tail = n;
    l->head = n;
    l->size++;
}

void unlink_node(DList *l, DNode *n) {
    if (n->prev) n->prev->next = n->next;
    else l->head = n->next;
    if (n->next) n->next->prev = n->prev;
    else l->tail = n->prev;
    free(n);
    l->size--;
}

void remove_all(DList *l, int value) {
    DNode *p = l->head;
    while (p) {
        DNode *next = p->next;
        if (p->data == value) unlink_node(l, p);
        p = next;
    }
}

void print_forward(const DList *l) {
    printf("[%d] ", l->size);
    for (DNode *p = l->head; p; p = p->next) printf("%d ", p->data);
    printf("\n");
}

void print_backward(const DList *l) {
    for (DNode *p = l->tail; p; p = p->prev) printf("%d ", p->data);
    printf("\n");
}

void clear(DList *l) {
    while (l->head) unlink_node(l, l->head);
}

int main(void) {
    DList l = {NULL, NULL, 0};
    for (int i = 1; i <= 5; i++) append(&l, i * 10);
    prepend(&l, 5);
    append(&l, 20);
    print_forward(&l);
    print_backward(&l);

    remove_all(&l, 20);
    unlink_node(&l, l.head);
    unlink_node(&l, l.tail);
    print_forward(&l);
    print_backward(&l);

    clear(&l);
    print_forward(&l);
    return 0;
}
