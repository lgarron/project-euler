#include <stdbool.h>
#include <stdio.h>

#include "sieve.h"

#define MAX 100

int main(int argc, char* argv[]) {

  if (argc == 1) {
    printf("Usage: %s 100\n", argv[0]);
    printf("Prints all primes under the given value.\n");
    return;
  }

  int max = atoi(argv[1]);

  bool* primeQ = sieve(max);

  printf("Primes under %d:\n", max);
  int i;
  for (i = 0; i < max; i++) {
    if (primeQ[i]) {
      printf("%d\n", i);
    }
  }

  free(primeQ);

  return 0;
}