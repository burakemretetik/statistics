#include <stdio.h>
#include <stdlib.h>

typedef struct Tree {
    int key;
    struct Tree *left, *right;
} Tree;

Tree *insert(Tree *root, int key) {
    if (!root) {
        Tree *n = malloc(sizeof(Tree));
        n->key = key;
        n->left = n->right = NULL;
        return n;
    }
    if (key < root->key) root->left = insert(root->left, key);
    else if (key > root->key) root->right = insert(root->right, key);
    return root;
}

Tree *search(Tree *root, int key) {
    while (root && root->key != key)
        root = key < root->key ? root->left : root->right;
    return root;
}

Tree *min_node(Tree *root) {
    while (root->left) root = root->left;
    return root;
}

Tree *delete(Tree *root, int key) {
    if (!root) return NULL;
    if (key < root->key) root->left = delete(root->left, key);
    else if (key > root->key) root->right = delete(root->right, key);
    else {
        if (!root->left || !root->right) {
            Tree *child = root->left ? root->left : root->right;
            free(root);
            return child;
        }
        Tree *succ = min_node(root->right);
        root->key = succ->key;
        root->right = delete(root->right, succ->key);
    }
    return root;
}

void inorder(Tree *t) { if (t) { inorder(t->left); printf("%d ", t->key); inorder(t->right); } }
void preorder(Tree *t) { if (t) { printf("%d ", t->key); preorder(t->left); preorder(t->right); } }
void postorder(Tree *t) { if (t) { postorder(t->left); postorder(t->right); printf("%d ", t->key); } }

int height(Tree *t) {
    if (!t) return -1;
    int l = height(t->left), r = height(t->right);
    return 1 + (l > r ? l : r);
}

int count_nodes(Tree *t) { return t ? 1 + count_nodes(t->left) + count_nodes(t->right) : 0; }
int count_leaves(Tree *t) {
    if (!t) return 0;
    if (!t->left && !t->right) return 1;
    return count_leaves(t->left) + count_leaves(t->right);
}

void free_tree(Tree *t) {
    if (!t) return;
    free_tree(t->left);
    free_tree(t->right);
    free(t);
}

int main(void) {
    int keys[] = {50, 30, 70, 20, 40, 60, 80, 35, 45, 65};
    Tree *root = NULL;
    for (int i = 0; i < 10; i++) root = insert(root, keys[i]);

    printf("inorder:   "); inorder(root); printf("\n");
    printf("preorder:  "); preorder(root); printf("\n");
    printf("postorder: "); postorder(root); printf("\n");
    printf("nodes %d, leaves %d, height %d\n", count_nodes(root), count_leaves(root), height(root));
    printf("min %d, 45 found: %s, 99 found: %s\n", min_node(root)->key,
           search(root, 45) ? "yes" : "no", search(root, 99) ? "yes" : "no");

    root = delete(root, 20);
    root = delete(root, 30);
    root = delete(root, 50);
    printf("after deleting 20, 30, 50: "); inorder(root); printf("\n");
    printf("new root %d, height %d\n", root->key, height(root));

    Tree *chain = NULL;
    for (int i = 1; i <= 10; i++) chain = insert(chain, i);
    printf("sorted input gives height %d\n", height(chain));

    free_tree(root);
    free_tree(chain);
    return 0;
}
