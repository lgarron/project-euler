/* Project Euler, Problem #74
 * Lucas Garron
 * Date: September 02, 2014
 *
 */

#include <assert.h>
#include <stdio.h>

#define MAX_START (1000000)
#define CYCLE_LENGTH (60)
#define MAX_LINK (10000000)

int factorial[] = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880};

// Initialize everything to 0.
int nextLink[MAX_LINK] = {0};

int getNextLink(int n) {
  if (n == 0) { return 0; }
  assert(n < MAX_LINK);
  if (nextLink[n] != 0) { return nextLink[n]; }

  nextLink[n] = factorial[n % 10] + getNextLink(n / 10);
  return nextLink[n];
}

// http://en.wikipedia.org/wiki/Cycle_detection#Brent.27s_algorithm
int chainLength(int start) {
  int power = 1;
  int lam = 1;

  int tortoise = start;
  int hare = getNextLink(start);
  while (tortoise != hare) {
    if (power == lam) {
      tortoise = hare;
      power *= 2;
      lam = 0;
    }
    hare = getNextLink(hare);
    lam += 1;
  }

  int mu = 0;
  tortoise = start;
  hare = start;

  for (int i = 0; i < lam; i++) {
    hare = getNextLink(hare);
  }

  while (tortoise != hare) {
    tortoise = getNextLink(tortoise);
    hare = getNextLink(hare);
    mu += 1;
  }

  return lam + mu;
}

int result() {

  int num_chains = 0;

  for (int i = 0; i < MAX_START; i++) {
    if (chainLength(i) == CYCLE_LENGTH) {
      num_chains++;
    }
  }
  return num_chains;
}

int main() {

  printf("%d\n", result());

  return 0;
}
