void recursion_infinie(int n) {
    volatile int tampon[1024];  // empêche l’optimisation
    tampon[0] = n;

    printf("%d\n", n);

    recursion_infinie(n + 1);

    // empêche l'optimisation tail-call
    printf("%d\n", tampon[0]);
}

int main(void) {
    recursion_infinie(0);
    return 0;
}

// Utiliser echo $LASTEXITCODE dans le terminal s'il n'y a aucun message d'erreur pour vérifier que ce n'est pas 0.