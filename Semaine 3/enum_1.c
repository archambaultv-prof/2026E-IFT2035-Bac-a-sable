#include <stdio.h>

enum Couleur { ROUGE, VERT, BLEU };

int main() {
    enum Couleur c = 12;
    if (c == ROUGE) {
        printf("La couleur est rouge\n");
    } else if (c == VERT) {
        printf("La couleur est verte\n");
    } else if (c == BLEU) {
        printf("La couleur est bleue\n");
    } else {
        printf("La couleur est inconnue\n");
    }
    return 0;
}
