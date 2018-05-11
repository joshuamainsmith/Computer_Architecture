#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main ()
{
    int a = 5, b = 6;
    char str1[7] = "pickle";
    char str2[7] = "banana";

    swap (&a, &b);

    printf ("a = %d, b = %d", a, b);

    scpy(&str1, &str2);

    printf ("str1 = %c, str2 = %c", str1, str2);


    return 0;
}



int swap (int *a, int *b)
{
    int t;

    t = *a;
    *a = *b;
    *b = t;
}

void scpy (char *a, char *b)
{
    while (*a++ = *b++);
}
