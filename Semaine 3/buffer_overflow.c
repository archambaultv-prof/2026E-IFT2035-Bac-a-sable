// Exemple de buffer overflow en C
// Utilise une structure pour garantir l'ordre des variables en mémoire,
// ce qui rend l'écrasement de `flag` observable et reproductible.
#include <stdio.h>
#include <string.h>

// Les membres sont contigus en mémoire : buffer est suivi immédiatement de flag.
typedef struct {
    char buffer[8];
    int  flag;
} frame_t;

void vulnerable_function(char *input) {
    frame_t f;
    f.flag = 42;

    printf("=== Avant le buffer overflow ===\n");
    printf("  f.flag   = %d\n", f.flag);
    printf("  &buffer  = %p\n", (void *)f.buffer);
    printf("  &flag    = %p\n", (void *)&f.flag);
    printf("  distance = %td octets\n\n", (char *)&f.flag - f.buffer);

    // strcpy ne vérifie pas la taille : les octets excédentaires
    // débordent dans f.flag (comportement indéfini, mais observable ici).
    strcpy(f.buffer, input);

    printf("=== Après le buffer overflow ===\n");
    printf("  f.flag   = %d  (initialement 42 !)\n", f.flag);
    printf("  buffer   = %s\n", f.buffer);
}

int main() {
    // Les 8 premiers octets remplissent buffer[0..7].
    // Les octets suivants écrasent f.flag (4 octets, little-endian).
    // 'X' == 0x58  =>  "XXXX" => flag = 0x58585858 = 1482184792
    char input[] = "AAAAAAAXXXXXX";
    vulnerable_function(input);
    return 0;
}