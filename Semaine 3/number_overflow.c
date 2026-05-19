#include <stdio.h>

int main(void) {
    char c = 127;
    c = c + 1;
    printf("%d\n", c);   /* a) */

    unsigned char u = 255;
    u = u + 1;
    printf("%d\n", u);   /* b) */

    int n = 2147483647;
    n = n + 1;
    printf("%d\n", n);   /* c) */

    return 0;
}