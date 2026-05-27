
int main(void) {
    int notes[5] = {18, 15, 12, 17, 14};
    char x = 'A';
    printf("%d\n", x);  /* 18 */

    /* Accès par indice (commence à 0) */
    printf("%d\n", notes[0]);  /* 18 */
    printf("%d\n", notes[4]);  /* 14 */

    /* Modification */
    notes[2] = 20;
    printf("%d\n", notes[2]);  /* 20 */

        /* Modification */
    notes[5] = 20;
    printf("%d\n", notes[5]);  /* 20 */
    printf("%d\n", x);
};