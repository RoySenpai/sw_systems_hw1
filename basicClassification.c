#include <stdbool.h>
#include <math.h>
#include "NumClass.h"

long factorial(int);

int isPrime(int x) {
    int pos;

    // 0 & 1 aren't primes!
    // But for some reason we now consider 1 as a prime.
    // :(
    if (!x)
        return false;

    for (pos = 2; pos <= sqrt(x); ++pos)
    {
        if (x % pos == 0)
            return false;
    }

    return true;
}

int isStrong(int x) {
    int tmp_res = x;
    int fac_sum = 0;

    if (!x)
        return false;

    while (tmp_res > 0)
    {
        fac_sum += factorial((tmp_res % 10));
        tmp_res /= 10;
    }

    return ((fac_sum == x) ? true:false);
}

long factorial(int x) {
    if (x == 0)
        return 1;

    return x*factorial(x-1);
}