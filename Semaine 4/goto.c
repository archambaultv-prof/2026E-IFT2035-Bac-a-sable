void main(){
    int x = 1;

debut:
    x = x * 2;
    if (x < 100) goto debut;

    printf("%d\n", x);
}