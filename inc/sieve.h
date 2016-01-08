#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

static int* sieve;
static bool initialized;
static int max;

#define SIEVE_ASSERT (true)

/*
 * Written by Lucas Garron on December 26, 2012
 * (For Project Euler problem 333.)
 *
 * Allocates and computes a boolean array
 * with true indicating primality.
 * 
 * Note that 0 and 1 are not prime.
 */
void initSieve(int maxIn) {

  assert(!initialized);
  max = maxIn;

  sieve = calloc(max, sizeof(int));

  int i, j;
  for (i = 2; i*i <= max; i++) {
    if (sieve[i] == 0) {
      /* We could set sieve[i] = i,
         but then we'd have to iterate i up to max,
         which actually does take a bit longer.
         So we'll keep 0 as a sentinel value. */
      for (j = i*2; j < max; j+=i) {
        if (sieve[j] == 0) {
          sieve[j] = i;
        }
      }
    }
  }

  initialized = true;
}

bool isPrime(int n) {
  if (SIEVE_ASSERT) assert(initialized);
  if (SIEVE_ASSERT) assert(n < max);
  if (n < 2) {
    return false;
  }
  return (sieve[n] == 0);
}

int smallestFactor(int n) {
  if (SIEVE_ASSERT) assert(initialized);
  if (SIEVE_ASSERT) assert(n > 1);
  if (SIEVE_ASSERT) assert(n < max);
  if (sieve[n] == 0) {
    return n; 
  }
  return sieve[n];
}

void freeSieve() {
  free(sieve);
}