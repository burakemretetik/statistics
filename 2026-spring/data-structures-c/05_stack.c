#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>

#define CAP 100

typedef struct {
    double items[CAP];
    int top;
} Stack;

void init(Stack *s) { s->top = -1; }
bool empty(const Stack *s) { return s->top == -1; }

bool push(Stack *s, double x) {
    if (s->top == CAP - 1) return false;
    s->items[++s->top] = x;
    return true;
}

double pop(Stack *s) {
    if (empty(s)) {
        fprintf(stderr, "stack underflow\n");
        exit(1);
    }
    return s->items[s->top--];
}

double peek(const Stack *s) { return s->items[s->top]; }

bool balanced(const char *expr) {
    Stack s;
    init(&s);
    for (const char *c = expr; *c; c++) {
        if (strchr("([{", *c)) push(&s, *c);
        else if (strchr(")]}", *c)) {
            if (empty(&s)) return false;
            char open = (char)pop(&s);
            if ((*c == ')' && open != '(') || (*c == ']' && open != '[') || (*c == '}' && open != '{'))
                return false;
        }
    }
    return empty(&s);
}

double eval_postfix(const char *expr) {
    Stack s;
    init(&s);
    char buf[200];
    strcpy(buf, expr);
    for (char *tok = strtok(buf, " "); tok; tok = strtok(NULL, " ")) {
        if (isdigit((unsigned char)tok[0])) {
            push(&s, atof(tok));
        } else {
            double b = pop(&s), a = pop(&s);
            switch (tok[0]) {
                case '+': push(&s, a + b); break;
                case '-': push(&s, a - b); break;
                case '*': push(&s, a * b); break;
                case '/': push(&s, a / b); break;
            }
        }
    }
    return pop(&s);
}

void to_binary(int n) {
    Stack s;
    init(&s);
    if (n == 0) push(&s, 0);
    while (n > 0) {
        push(&s, n % 2);
        n /= 2;
    }
    while (!empty(&s)) printf("%d", (int)pop(&s));
    printf("\n");
}

int main(void) {
    Stack s;
    init(&s);
    for (int i = 1; i <= 4; i++) push(&s, i * 1.5);
    printf("top %.1f\n", peek(&s));
    while (!empty(&s)) printf("%.1f ", pop(&s));
    printf("\n");

    const char *tests[] = {"(a+b)*[c-d]", "{[()()]}", "(a+b))", "([)]", "((("};
    for (int i = 0; i < 5; i++)
        printf("%-12s %s\n", tests[i], balanced(tests[i]) ? "balanced" : "not balanced");

    printf("3 4 + 2 * 7 / = %.4f\n", eval_postfix("3 4 + 2 * 7 /"));
    printf("5 1 2 + 4 * + 3 - = %.0f\n", eval_postfix("5 1 2 + 4 * + 3 -"));

    to_binary(156);
    return 0;
}
