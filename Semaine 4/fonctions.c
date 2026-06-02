int additionner(int a, int b) { return a + b; }
int multiplier(int a, int b)  { return a * b; }

/* Déclaration : pointeur vers une fonction (int, int) → int */
int (*operation)(int, int);

void main(void) {
    operation = additionner;              /* pointe vers additionner */
    printf("%d\n", operation(3, 4));  /* 7  */

    operation = multiplier;               /* pointe maintenant vers multiplier */
    printf("%d\n", operation(3, 4));  /* 12 */
}