/* Project Euler, Problem #78
 * Lucas Garron
 * Date: September 02, 2014
 *
 */

#include <assert.h>
#include <stdio.h>

#define MODULUS (1000000)

// MAX can be set to any value safely:
//   the program will either assert(0) or output the correct answer.
// If the answer is X, you need MAX > X to find it.
#define MAX (100000)

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

  assert(0); // No solution less than MAX found.
}

int main() {
  printf("%d\n", result());
  return 0;
}
