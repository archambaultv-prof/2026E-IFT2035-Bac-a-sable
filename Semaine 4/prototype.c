/* Prototypes — déclarations anticipées */
int carre(int x);
int somme_carres(int a, int b);

int main(void) {
    printf("%d\n", somme_carres(3, 4));  /* OK : le compilateur connaît la signature */
    return 0;
}

/* Définitions — corps des fonctions */
int carre(int x) {
    return x * x;
}

int somme_carres(int a, int b) {
    return carre(a) + carre(b);
}