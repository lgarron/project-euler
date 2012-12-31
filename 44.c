/* Project Euler, Problem #
 * Lucas Garron
 * Date: 
 */

#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <math.h>

#define MAX 10000000

int pentagonalNumbers[MAX];

// int pentagonalNumber(int i) {
//   return i * (3*i - 1) / 2;
// }

void initPentagonalNumbers() {
  pentagonalNumbers[0] = 0;
  int i;
  for (i = 1; i < MAX; i++) {
    pentagonalNumbers[i] = pentagonalNumbers[i-1] + 3*i - 2;
  }
}

bool isPentagonal(int n) {
  int prod = 1+24*n;
  int s = sqrt(prod);
  return s*s == prod && (1+s) % 6 == 0;
}

int tryDifference(int d) {
  // Index by which all differences between pentagonal numbers are > d.
  // (Slight overestimate from 3*i-2.)
  int maxIndex = d/3;
  assert(maxIndex < MAX);

  int i;
  for (i = 1; i < maxIndex; i++) {
    int base = pentagonalNumbers[i];
    if (isPentagonal(base+d) && isPentagonal(base+2*d)) {
      fprintf (stderr, "Pentagonal numbers with difference %d: %d, %d, %d\n", d, base, base+d, base+2*d);
      return base;
    }
  }

  return -1;
}

int result() {

  initPentagonalNumbers();

  int p, difference;
  int i;
  for (i = 0; i < MAX; i++) {
    p = pentagonalNumbers[i];
    difference = tryDifference(p);
    if (difference != -1) {
      break;
    }
  }
  
  return difference;
}

int main() {

  printf("%d\n", result());
  
  return 0;
}
