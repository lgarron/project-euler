#include <stdio.h>
#include <stdbool.h>

// Maximum number + space for 1-indexing.
#define MAX (28123+1)

/*
 * Trial division.
 */
long smallestFactor(long n) {
  int i;
  for (i = 2; i*i <= n; i++) {
    if (n % i == 0) {
      return i;
    }
  }
  return n;
}

long divisorSum(long n) {
  long nRemaining = n;
  long result = 1;
  long nextFactor = smallestFactor(nRemaining);

  while (nRemaining > 1) {
    long factor = nextFactor;
    long factorPower = factor;
  
    nextFactor = smallestFactor(nRemaining / factorPower);
    while (nextFactor == factor) {
      factorPower *= factor;
      nextFactor = smallestFactor(nRemaining / factorPower);
    }

    result *= (factorPower * factor - 1) / (factor - 1); // Math time!
    nRemaining /= factorPower;
  }
  return result;
}

bool abundantQ(long n) {
  return divisorSum(n) > 2*n;
}

int main(int argc, char* argv[]) {

  // Build a cache of which numbers are abundant.
  bool isAbundant[MAX];
  long i;
  for(i = 1; i < MAX; i++) {
    isAbundant[i] = abundantQ(i);
  }

  // A list to fill in with values indicating the sum of two abundant numbers.
  bool isAbundantSum[MAX];
  for(i = 1; i < MAX; i++) {
    isAbundantSum[i] = false;
  }

  // Try all pairs of adunbant numbers in the range.
  for(i = 1; i < MAX; i++) {
    int j;
    if (isAbundant[i]) { // Short-circuit.
      for(j = 1; j < MAX-i; j++) {
        if (isAbundant[j]) {
          isAbundantSum[i + j] = true;
        }
      }
    }
  }

  // Compute the total.
  long total = 0;
  for (i = 1; i < MAX; i++) {
    if (!isAbundantSum[i]) {
      total += i;
    }
  }

  printf("%ld\n", total);

  return 0;
}