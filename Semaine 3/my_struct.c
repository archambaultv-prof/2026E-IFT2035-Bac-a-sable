struct Personne {
    char nom;   /* pointeur vers une chaîne */
    int   age;
};

/* Mauvaise disposition — 32 octets */
struct Mauvais {
    char    c;   /*  1 octet  @ 0                          */
    /* 7 octets de padding interne (aligner double sur 8)  */
    double  a;   /*  8 octets @ 8                          */
    char    d;   /*  1 octet  @ 16                         */
    /* 3 octets de padding interne (aligner int sur 4)     */
    int     b;   /*  4 octets @ 20                         */
    char    e;   /*  1 octet  @ 24                         */
    char    f;   /*  1 octet  @ 25                         */
    /* 6 octets de padding de fin (arrondir à multiple de 8) */
};
/* sizeof == 32 — données utiles : 16 octets, gaspillage : 16 octets */

/* Bonne disposition — 16 octets */
struct Bon {
    double  a;   /*  8 octets @ 0  */
    int     b;   /*  4 octets @ 8  */
    char    c;   /*  1 octet  @ 12 */
    char    d;   /*  1 octet  @ 13 */
    char    e;   /*  1 octet  @ 14 */
    char    f;   /*  1 octet  @ 15 */
    /* aucun padding — 16 est déjà un multiple de 8 */
};
/* sizeof == 16 */

int main(void) {
    struct Personne paul = {'P', 23};
    printf("Nom : %c, age : %d\n", paul.nom, paul.age);
    // Taille de la structure
    printf("Taille de struct Personne : %zu\n", sizeof(struct Personne));
    printf("Taille de struct Mauvais : %zu\n", sizeof(struct Mauvais));
    printf("Taille de struct Bon : %zu\n", sizeof(struct Bon));
}