#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

/*
 * Written by Lucas Garron on December 26, 2012
 * (For Project Euler problem 333.)
 *
 * Allocates and computes a boolean array
 * with true indicating primality.
 *
 * The aray is zero-indexed, i.e. to check if 7 is prime,
 * check primeQ[7] (don't subtract 1).
 *
 * Note that 0 and 1 are not prime.
 *
 * Example use:

  bool* primeQ = sieve(100);
  // Use the array.
  free(primeQ);

 */
bool* sieve(int max) {

  bool* primeQ = malloc(max * sizeof(bool));
  assert(sizeof(bool) == sizeof(char));
  memset(primeQ, true, max);

  primeQ[0] = false;
  primeQ[1] = false;

  int i, j;
  for (i = 2; i*i <= max; i++) {
    if (primeQ[i]) {
      for (j = i*2; j < max; j+=i) {
        primeQ[j] = false;
      }
    }
  }

  return primeQ;
}
