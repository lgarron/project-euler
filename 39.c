/* Project Euler, Problem #39
 * Lucas Garron
 * Date: December 28, 2012
 */

#include <stdio.h>

int countTriples (int sum) {
  int num = 0;

  int a, b, c;
  for (a = 0; a < sum; a++) {
    for (b = 0; b < sum - a; b++) {
      c = sum - a - b;
      if (a*a + b*b == c*c) {
        num++;
      }
    }
  }

  return num;
}

int result() {

  int best = 0;
  int bestN = 0;

  int n;
  for (n = 1; n < 1000; n++) {
    int num = countTriples(n);
    if (num > best) {
      best = num;
      bestN = n;
    }
  }

  return bestN;
}

int main() {

  printf("%d\n", result());
  
  return 0;
}
