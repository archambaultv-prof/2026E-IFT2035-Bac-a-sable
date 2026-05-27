#include <stdio.h>
#include <stdbool.h>

enum Couleur { ROUGE, VERT, BLEU };

int main(void) {
    char c = 34;
    printf("sizeof(char) = %zu\n", sizeof(char));

    int i = 34;
    printf("sizeof(int) = %zu\n", sizeof(int));

    float f = 34.0;
    printf("sizeof(float) = %zu\n", sizeof(float));

    double d = 34.0;
    printf("sizeof(double) = %zu\n", sizeof(double));

    bool b = true;
    printf("sizeof(bool) = %zu\n", sizeof(bool));

    enum Couleur c3 = VERT;
    printf("sizeof(enum Couleur) = %zu\n", sizeof(enum Couleur));
    printf("ma couleur = %d\n", c3);

    enum Couleur c2 = VERT + 1;
    printf("sizeof(enum Couleur) = %zu\n", sizeof(enum Couleur));
    printf("ma couleur = %d\n", c2);
}