#include <stdbool.h>
#include <stdio.h>

#include "sieve.h"

int main(int argc, char* argv[]) {

  if (argc == 1) {
    printf("Usage: %s 100\n", argv[0]);
    printf("Prints the smallest factors of all numbers under the given value.\n");
    return -1;
  }

  int max = atoi(argv[1]);

  initSieve(max);

  printf("Primes under %d:\n", max);
  int i;
  for (i = 2; i < max; i++) {
    printf("Smallest factor of %d: %d%s\n", i, smallestFactor(i), isPrime(i) ? " - PRIME!" : "");
  }

  freeSieve();

  return 0;
}