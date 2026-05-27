struct Personne {
    char nom;   /* pointeur vers une chaîne */
    int   age;
};

int main(void) {
    struct Personne paul = {'P', 23};
    printf("Nom : %c, age : %d\n", paul.nom, paul.age);
    // Taille de la structure
    printf("Taille de struct Personne : %zu\n", sizeof(struct Personne));
}