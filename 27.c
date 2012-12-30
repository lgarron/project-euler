/* Project Euler, Problem #27
 * Lucas Garron
 * Date: December 26, 2012
 */

#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#include "inc/sieve.h"

#define MAX 999
#define SIEVE_SIZE 1000000

bool* primeQ; // Will be malloced.

bool isPrime(int n) {
  if (n<0) {
    return false;
  }
  assert(n < SIEVE_SIZE);
  return primeQ[n];
}

int primeRun(int a, int b) {
  int n = 0;
  while (isPrime(n*n + a*n+b)) {
    n++;
  }
  return n;
}

int result() {

  primeQ = sieve(SIEVE_SIZE);

  int best = 0;
  int bestCoefficientProduct = 0;

  int a, b;
  for (a = -MAX; a <= MAX; a++) {
    for (b = -MAX; b <= MAX; b++) {
      int run = primeRun(a, b);
      if (run > best) {
        best = run;
        bestCoefficientProduct = a * b;
      }
    }
  }

  free(primeQ);

  return bestCoefficientProduct;
}

int main() {

  printf("%d\n", result());
  
  return 0;
}
