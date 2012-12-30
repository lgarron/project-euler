/* Project Euler, Problem #407
 * Lucas Garron
 * Date: December 25, 2012
 *
 * This code was in the middle of being rewritten to be "better"
 * when it started to be fast enough to solve the problem.
 * Some of the optimizations (e.g. going by largest factor instead of smallest)
 * are complicated and not particularly helpful, but they do *work*.
 * Don't take it as an example of my best work.
 * Running time about 13 minutes for me.
 */


#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#define MAX (10000000+1)

int smallestFactor[MAX];
int smallestNext[MAX];

int largestFactor[MAX];
int largestNext[MAX];

int computeLargestFactor(int n) {
  int n_left = n;
  while (n_left > 0) {
    //printf("---%d\n", n_left);
    int next_n_left = smallestNext[n_left];
    if (next_n_left == 1) {
      return n_left;
    }
    n_left = next_n_left;
  }
  assert(false);
}

void sieve() {
  memset(smallestFactor, 0, sizeof(smallestFactor));

  int i, j;
  for (i=2; i<MAX; i++) {
    if (smallestFactor[i] == 0) {
      for (j=i; j<MAX; j+=i) {
        if (smallestFactor[j] == 0) {
          smallestFactor[j] = i;
          smallestNext[j] = j/i;
        }
      }
    }
  }
  for (i=2; i<MAX; i++) {
    largestFactor[i] = computeLargestFactor(i);
    largestNext[i] = i/largestFactor[i];
  }
}

/* Doesn't save time for our use case.
// Short-circuiting evaluation.
bool primePowerQ(int n) {
  int factor = smallestFactor[n];
  int n_left = next[n];
  while (n_left > 1) {
    if (smallestFactor[n_left] != factor) {
      return false;
    }
    n_left = next[n_left];
  }
  return true;
}
*/

bool primePowerQ(int n) {
  return smallestFactor[n] == largestFactor[n];
}

/*
 * Returns whether x*y/n is a positive integer.
 * Assumes x, y, n are given as ints < MAX, and n>0.
 */
int productModQ(int x, int y, int n) {
  // printf("productModQ: %d, %d, %d\n", x, y, n);
  if (n==1) {
    return true;
  }
  if (x == 0 && y == 0) {
    return false;
  }

  int lx = largestFactor[x];
  int ly = largestFactor[y];
  int ln = largestFactor[n];

  // printf("L: %d, %d, %d\n", lx, ly, ln);

  if (ln > lx && ln > ly) {
    return false;
  }

  if (lx == ln) {
    return productModQ(largestNext[x], y, largestNext[n]);
  }
  if (lx > ln && x > 0) {
    return productModQ(largestNext[x], y, n);
  }
  if (ly == ln) {
    return productModQ(x, largestNext[y], largestNext[n]);
  }
  if (ly > ln && y > 0) {
    return productModQ(x, largestNext[y], n);
  }
  return false;
}

int largestIdempodent(int n) {
  int largest = largestFactor[n];
  if (smallestFactor[n] == largest) {
    return 1;
  }
  int i;
    // printf("Reached %d for %d.\n", computeLargestFactor(n), n);
  for (i = n-largest; i > 0; i-=largest) {
    // printf("Reached %d for %d.\n", i, n);
    if (productModQ(i+1, i, n)) {
      return i+1;
    }
    if (productModQ(i, i-1, n)) {
      return i;
    }
  }
  return 1;
}

int main(int argc, char* argv[]) {

  sieve();
  long sum = 0;

  int i;
  for (i=2; i<MAX; i++) {
    if (i % 100000 == 0) {
      fprintf(stderr, "Evaluating %d\n", i);
    }
    //printf("- %d: %d\n", i, largestIdempodent(i));
    sum += largestIdempodent(i);
  }

  printf("%lu\n", sum);
  return 0;
}