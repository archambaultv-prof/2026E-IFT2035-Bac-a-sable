union Valeur {
    int   entier;
    double flottant;
    char  caractere;
};

int main(void) {
    union Valeur v;
    v.entier = 42;
    printf("%d\n", v.entier);    /* 42 */

    v.flottant = 42;
    /* À partir de maintenant, v.entier est invalide — la mémoire a été réécrite */

    {
        union Valeur v;
        v.entier = 43;
        printf("%d\n", v.entier);    /* 42 */
    }

}





