#include <math.h>
#include "NumClass.h"

long factorial(int);

int isPrime(int x) {
    int pos;

    for (pos = 2; pos < sqrt(x); ++pos)
    {
        if (x % pos == 0)
            return FALSE;
    }

    return TRUE;
}

int isStrong(int x) {
    int tmp_res = x;
    int fac_sum = 0;

    while (tmp_res > 0)
    {
        fac_sum = factorial((tmp_res % 10));
        tmp_res /= 10;
    }

    return ((fac_sum == x) ? TRUE:FALSE);
}

long factorial(int x) {
    if (x == 0)
        return 1;

    return x + factorial(x-1);
}