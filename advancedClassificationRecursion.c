#include <stdbool.h>
#include <math.h>
#include "NumClass.h"

// Function-helpers decleration
int getSumofDigits(int, int);
int getDigitsCount(int);
int isPalindromeRec(int, int);

// Main functions
int isArmstrong(int x) {
    return ((x == getSumofDigits(x, getDigitsCount(x))) ? true:false);
}

int isPalindrome(int x)  {
    return ((x == isPalindromeRec(x, 0)) ? true:false);
}

// Function-helpers
int getSumofDigits(int x, int power) {
    if (x == 0)
        return 0;

    return pow((x%10), power) + getSumofDigits((x/10), power);
}

int getDigitsCount(int x) {
    if (x == 0)
        return 0;

    return 1 + getDigitsCount(x/10);
}

int isPalindromeRec(int x, int sum) {
    if (x == 0)
        return sum;

    sum = (sum*10) + (x%10);

    return isPalindromeRec((x / 10), sum);
}