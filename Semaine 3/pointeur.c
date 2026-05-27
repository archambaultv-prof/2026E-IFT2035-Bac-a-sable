#include <stddef.h>

int main(void) {
    int x = 42;
    int* p = &x;   /* p contient l'adresse de x, par exemple 1000 */

    printf("%p\n", (void*)     p);  /* affiche l'adresse, ex : 0x3E8 — voir note ci-dessous */
    printf("%d\n", *p);        /* déréférence : affiche 42 */

    int* p2 = NULL;
    printf("%p\n", (void*)     p2);  /* affiche NULL, généralement 0x0 */
    *p2 = 42; /* INTERDIT : plantage garanti (segfault) */

    // if (p != NULL) {
    //     *p = 42;  /* accès sûr, uniquement si p est valide */
    // }


    return 0;
}