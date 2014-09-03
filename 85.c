/* Project Euler, Problem #85
 * Lucas Garron
 * Date: September 02, 2014
 *
 */

#include <assert.h>
#include <stdio.h>
#include <stdlib.h> // for abs(...)

#define TARGET (2000000)
#define MAX_DIMENSIONS (2014) // Needs to be a bit larger than sqrt(2*TARGET)

int table[MAX_DIMENSIONS][MAX_DIMENSIONS];

int numRects(m, n) {
  if (m == 0 || n == 0) { return 0; }
  assert(m < MAX_DIMENSIONS && n < MAX_DIMENSIONS);
  if (m > n) { return numRects(n, m); }
  if (table[m][n] != 0) { return table[m][n]; }

  table[m][n] = (m * n)
                 + numRects(m-1, n  )
                 + numRects(m  , n-1)
                 - numRects(m-1, n-1);
  return table[m][n];
}


int result() {

  int closest = 0;
  int mClosest = 0;
  int nClosest = 0;

  for (int m = 1; m < MAX_DIMENSIONS; m++) {
    for (int n = 1; n < MAX_DIMENSIONS; n++) {
      int value = numRects(m, n);

      // printf("%d, %d: %d\n", m, n, value);

      if (abs(value - TARGET) < abs(closest - TARGET)) {
        closest = value;
        mClosest = m;
        nClosest = n;
        // printf("%d, %d: %d\n", m, n, value);
      }

      if (value > TARGET) {
        // We've looked at one value past the target, so
        // we don't need to keep looking in this row.
        break;
      }
    }
  }

  return mClosest * nClosest;
}

int main() {
  printf("%d\n", result());
  return 0;
}
