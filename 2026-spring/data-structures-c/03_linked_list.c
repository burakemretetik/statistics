#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node *next;
} Node;

Node *new_node(int value) {
    Node *n = malloc(sizeof(Node));
    if (!n) exit(1);
    n->data = value;
    n->next = NULL;
    return n;
}

void push_front(Node **head, int value) {
    Node *n = new_node(value);
    n->next = *head;
    *head = n;
}

void push_back(Node **head, int value) {
    Node *n = new_node(value);
    if (*head == NULL) {
        *head = n;
        return;
    }
    Node *p = *head;
    while (p->next) p = p->next;
    p->next = n;
}

void insert_sorted(Node **head, int value) {
    Node *n = new_node(value);
    if (*head == NULL || value < (*head)->data) {
        n->next = *head;
        *head = n;
        return;
    }
    Node *p = *head;
    while (p->next && p->next->data < value) p = p->next;
    n->next = p->next;
    p->next = n;
}

int remove_value(Node **head, int value) {
    Node *p = *head, *prev = NULL;
    while (p && p->data != value) {
        prev = p;
        p = p->next;
    }
    if (!p) return 0;
    if (prev) prev->next = p->next;
    else *head = p->next;
    free(p);
    return 1;
}

Node *find(Node *head, int value) {
    for (; head; head = head->next)
        if (head->data == value) return head;
    return NULL;
}

void reverse(Node **head) {
    Node *prev = NULL, *cur = *head;
    while (cur) {
        Node *next = cur->next;
        cur->next = prev;
        prev = cur;
        cur = next;
    }
    *head = prev;
}

int length(Node *head) {
    int n = 0;
    for (; head; head = head->next) n++;
    return n;
}

void print(Node *head) {
    for (; head; head = head->next) printf("%d -> ", head->data);
    printf("NULL\n");
}

void free_list(Node **head) {
    while (*head) {
        Node *next = (*head)->next;
        free(*head);
        *head = next;
    }
}

int main(void) {
    Node *list = NULL;
    push_back(&list, 10);
    push_back(&list, 20);
    push_front(&list, 5);
    push_back(&list, 30);
    print(list);
    printf("length %d, 20 found: %s\n", length(list), find(list, 20) ? "yes" : "no");

    remove_value(&list, 20);
    remove_value(&list, 5);
    printf("removed 99? %d\n", remove_value(&list, 99));
    print(list);

    reverse(&list);
    print(list);
    free_list(&list);

    int values[] = {42, 7, 19, 3, 25, 11};
    for (int i = 0; i < 6; i++) insert_sorted(&list, values[i]);
    print(list);
    free_list(&list);
    return 0;
}
