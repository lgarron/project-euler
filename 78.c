/* Project Euler, Problem #78
 * Lucas Garron
 * Date: September 02, 2014
 *
 */

#include <stdio.h>

#define MAX (100000)
#define MODULUS (1000000)

// Initialized to 1 followed by zeroes.
int coefficients[MAX] = {1};

int result() {

  for (int i = 1; i < MAX; i++) {
    if (i % (MAX/10) == 0) {
      fprintf(stderr, "%d\n", i);
    }
    for (int j = i; j < MAX; j++) {
      coefficients[j] = (coefficients[j] + coefficients[j-i]) % MODULUS;
    }
  }

  for (int i = 0; i < MAX; i++) {
    // printf("%d: %d\n", i, coefficients[i]);
    if (coefficients[i] == 0) {
      return i;
    }
  }

  return -1;
}

int main() {
  printf("%d\n", result());
  return 0;
}
