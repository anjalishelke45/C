#include <stdio.h> #include <stdlib.h>

struct BSTREE
{
int data;
struct BSTREE *lc, *rc;
};
typedef struct BSTREE bstree;


bstree *root = NULL;


// Function declarations
bstree* create(bstree *root);
bstree* insert(bstree *root, bstree *temp); void display(bstree *root);
void inorder(bstree *root); void preorder(bstree *root); void postorder(bstree *root);
void search(bstree *root, int key);


int main()
{
int ch, key;


do
{
printf("\n\n------ MENU	");
printf("\n1) Create the tree"); printf("\n2) Display the tree"); printf("\n3) Search an element");
 
printf("\n4) Exit");
printf("\nEnter your choice: "); scanf("%d", &ch);

switch (ch)
{
case 1:
root = create(root); break;
case 2:
display(root); break;
case 3:
printf("\nEnter element to search: "); scanf("%d", &key);
search(root, key); break;
case 4:
printf("\nExiting program...\n"); break;
default:
printf("\nInvalid choice!");
}
} while (ch != 4);


return 0;
}


bstree* create(bstree *root)
{
int i, n, d;
 
bstree *temp;
printf("\nEnter the number of nodes: "); scanf("%d", &n);

for (i = 0; i < n; i++)
{
temp = (bstree*)malloc(sizeof(bstree)); printf("Enter element %d: ", i + 1);
scanf("%d", &d); temp->data = d; temp->lc = NULL; temp->rc = NULL;

if (i == 0)
root = temp; else
root = insert(root, temp);
}
return root;
}


// ⬛ Missing function: BST insert logic bstree* insert(bstree *root, bstree *temp)
{
if (root == NULL) return temp;

if (temp->data < root->data)
root->lc = insert(root->lc, temp); else if (temp->data > root->data)
root->rc = insert(root->rc, temp);
 
// Duplicate values ignored (optional handling) return root;
}


void display(bstree *root)
{
if (root == NULL)
{
printf("\nTree is empty."); return;
}
printf("\nInorder traversal : "); inorder(root);
printf("\nPreorder traversal : "); preorder(root);
printf("\nPostorder traversal: "); postorder(root);
printf("\n");
}


void inorder(bstree *temp)
{
if (temp != NULL)
{
inorder(temp->lc);
printf("%d ", temp->data); inorder(temp->rc);
}
}


void preorder(bstree *temp)
 
{
if (temp != NULL)
{
printf("%d ", temp->data); preorder(temp->lc); preorder(temp->rc);
}
}


void postorder(bstree *temp)
{
if (temp != NULL)
{
postorder(temp->lc); postorder(temp->rc); printf("%d ", temp->data);
}
}


void search(bstree *root, int key)
{
bstree *temp = root; int flag = 0;

if (root == NULL)
{
printf("\nTree is empty."); return;
}


while (temp != NULL)
 
{
if (key == temp->data)
{
printf("\nElement %d found in the tree.", key); flag = 1;
break;
}
else if (key < temp->data) temp = temp->lc;
else
temp = temp->rc;
}


if (flag == 0)
printf("\nElement %d not found in the tree.", key);
}
