/* Project Euler, Problem #249
 * Lucas Garron
 * Date: January 08, 2016
 */

#include <assert.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#include "inc/sieve.h"

const uint64_t MODULUS = 10000000000000000; // 10^16
typedef uint64_t modded_int;

const int PRIME_BOUND = 5000;

// If the following values need to change, initPrimes() will tell us.
// const int NUM_PRIMES_UNDER_BOUND = 669;
// const int PRIME_SUM = 1548136;
const int NUM_PRIMES_UNDER_BOUND = 669;
const int MAX_SUM = 1548136;

int primeList[NUM_PRIMES_UNDER_BOUND];

/* table[sum][maxPrimeIndex] will contain:
 * - the number of subsets of `primeList`
 * - that sum to `sum`
 * - whose maximum element is at most `primeList[maxPrimeIndex]`
 * - as a value mod `MODULUS`.
 *
 * We could truncate this table to contain only the last `PRIME_BOUND` rows,
 * but on my computer the old rows get paged out and don't seem to impact
 * performance.
 */
modded_int table[MAX_SUM + 1][NUM_PRIMES_UNDER_BOUND];

void initPrimes() {
  initSieve(MAX_SUM + 1);
  int index = 0;
  int sum = 0;
  for (int i = 0; i < PRIME_BOUND; i++) {
    if (isPrime(i)) {
      primeList[index] = i;
      index++;
      sum += i;
    }
  }
  if(index != NUM_PRIMES_UNDER_BOUND || sum != MAX_SUM) {
    printf("Update as follows:\n\n");
    printf("const int NUM_PRIMES_UNDER_BOUND = %d;\n", index);
    printf("const int MAX_SUM = %d;\n", sum);
    exit(1);
  }
}

modded_int result() {
  initPrimes();

  modded_int primeSubsetSums = 0;

  for (int sum = 0; sum <= MAX_SUM; sum++) {
    // if (sum % 100 == 0) {
    //   printf("%0d\n", sum);
    // }
    // printf("%02d: ", sum);
    int isSumOfPrimeSet = 0;

    modded_int rollingRowSum = 0;

    for (int maxPrimeIndex = 0; maxPrimeIndex < NUM_PRIMES_UNDER_BOUND; maxPrimeIndex++) {
      modded_int value = 0;
      int isSumPrime = isPrime(sum);

      int maxPrime = primeList[maxPrimeIndex];
      if (sum > maxPrime) {
        modded_int* previousRow = table[sum - maxPrime];

        if (maxPrimeIndex > 0) {
          value = (value + previousRow[maxPrimeIndex - 1]) % MODULUS;
        }
      } else if (sum == maxPrime) {
        value = (value + 1) % MODULUS;
      }

      if (isSumPrime) {
        primeSubsetSums = (primeSubsetSums + value) % MODULUS;
      }
      rollingRowSum = (rollingRowSum + value) % MODULUS;
      table[sum][maxPrimeIndex] = rollingRowSum;
      // printf("%02llu ", value);
    }
    // printf("\n");
  }

  return primeSubsetSums;
}

int main() {

  printf("%llu\n", result());

  return 0;
}
