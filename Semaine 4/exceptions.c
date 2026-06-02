#include <setjmp.h>

jmp_buf point_de_retour;   /* sauvegarde l'état de la pile */

void h(void) {
    printf("h : erreur détectée\n");
    longjmp(point_de_retour, 1);  /* saut non-local ! */
    printf("jamais atteint\n");
}

void g(void) { h(); }
void f(void) { g(); }

int main(void) {
    if (setjmp(point_de_retour) == 0) {
        /* première exécution : setjmp retourne 0 */
        printf("main : appel de f()\n");
        f();
        printf("jamais atteint\n");
    } else {
        /* retour depuis longjmp : setjmp retourne 1 */
        printf("main : exception attrapée\n");
    }
    return 0;
}