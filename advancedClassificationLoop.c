#include <stdbool.h>
#include <math.h>
#include "NumClass.h"

int isArmstrong(int x) {
    int tmp = x, power = ((int)log10(x) + 1), sum = 0;

    while (tmp > 0)
    {
        sum += (int) pow((tmp%10),power);
        tmp /= 10;
    }
    
    return ((x == sum) ? true:false);
}

int isPalindrome(int x)  {
    int tmp = x, sum = 0;

    // Check if reversed number is the same as original.
    while (tmp > 0)
    {
        sum = (sum*10) + (tmp%10);
        tmp /= 10;
    }

    return ((x == sum) ? true:false);
}