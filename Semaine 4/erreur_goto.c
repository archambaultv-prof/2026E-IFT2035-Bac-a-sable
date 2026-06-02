int traiter(const char* nom_fichier) {
    FILE*  f   = NULL;
    char*  buf = NULL;
    int    rc  = -1;

    f = fopen(nom_fichier, "r");
    if (!f) goto fin;

    buf = malloc(4096);
    if (!buf) goto fin;

    /* traitement... */
    rc = 0;   /* succès */

fin:
    free(buf);    /* free(NULL) est sans effet — toujours sûr */
    if (f) fclose(f);
    return rc;
}