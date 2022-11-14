#include <stdio.h>
#include "NumClass.h"

int main() {
    int a, b, i;

    printf("Please enter two positive integers:\n");
    scanf("%d%d",&a,&b);

    while (a < 0 || b < 0)
    {
        printf("Please enter two **positive** integers:\n");
        scanf("%d%d",&a,&b);
    }

    int whichisBigger = (a < b);

    printf("Palindrome numbers: ");
    for (i = (whichisBigger ? a:b); i <= (!whichisBigger ? a:b); ++i)
    {
        if (isPalindrome(i))
            printf("%d, ", i);
    }

    printf("\nPrime numbers: ");
    for (i = (whichisBigger ? a:b); i <= (!whichisBigger ? a:b); ++i)
    {
        if (isPrime(i))
            printf("%d, ", i);
    }

    printf("\nStrong numbers: ");
    for (i = (whichisBigger ? a:b); i <= (!whichisBigger ? a:b); ++i)
    {
        if (isStrong(i))
             printf("%d, ", i);
    }

    printf("\nArmstrong numbers: ");
    for (i = (whichisBigger ? a:b); i <= (!whichisBigger ? a:b); ++i)
    {
        if (isArmstrong(i))
            printf("%d, ", i);
    }

    printf("\n");

    return 0;
}