void foo(void) {
    int *p = malloc(5 * sizeof(int));
    // ....
    int *q = p;
    free(p);

    int x = q[0];
}


void main(void) {
    int t[5] = {10, 20, 30, 40, 50};

    foo():
    int *p = malloc(5 * sizeof(int));

    printf("t[2] = %d\n", t[2]);  // Affiche 30
    printf("*(t + 2) = %d\n", *(t + 2));  // Affiche 30
    printf("2[t] = %d\n", 2[t]);  // Affiche 30
    // *(2 + t)
    free(p);
}