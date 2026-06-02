void main(void) {
    int t[5] = {10, 20, 30, 40, 50};

    printf("t[2] = %d\n", t[2]);  // Affiche 30
    printf("*(t + 2) = %d\n", *(t + 2));  // Affiche 30
    printf("2[t] = %d\n", 2[t]);  // Affiche 30
    // *(2 + t)
}