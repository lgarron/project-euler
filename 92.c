/* Project Euler, Problem #74
 * Lucas Garron
 * Date: September 02, 2014
 *
 */

#include <assert.h>
#include <stdio.h>

// MAX_START is a problem parameter.
// Set to any positive integer.
#define MAX_START (10000000)

// MAX_LINK is safe to change to anything, but it should be high enough.
// If not high enough, the program will run into an assertion rather than give a wrong answer.
#define MAX_LINK (100000000)

int squares[] = {0, 1, 4, 9, 16, 25, 36, 49, 64, 81};


// Initialize everything to 0.
int nextLink[MAX_LINK] = {0};

int getNextLink(int n) {
  if (n == 0) { return 0; }
  assert(n < MAX_LINK);
  if (nextLink[n] != 0) { return nextLink[n]; }

  nextLink[n] = squares[n % 10] + getNextLink(n / 10);
  return nextLink[n];
}


// Initialize everything to 0.
int finalLink[MAX_LINK] = {0};

int getFinalLink(int n) {
  assert(n < MAX_LINK);
  if (finalLink[n] != 0) { return finalLink[n]; }

  // Using the caches of getNextLink() gets us a factor of 2.5 overall speedup.
  int nextLink = getNextLink(n);
  // int nextLink = 0;
  // int nCopy = n;
  // while (nCopy > 0) {
  //   nextLink += squares[nCopy % 10];
  //   nCopy /= 10;
  // }

  // printf("%d, %d\n", n, nextLink);
  finalLink[n] = getFinalLink(nextLink);
  // printf("%d, %d, %d\n", n, nextLink, finalLink[n]);
  return finalLink[n];
}

int result() {

  finalLink[1] = 1;
  finalLink[89] = 89;

  int count89 = 0;
  for (int i = 1; i < MAX_START; i++) {
    if (getFinalLink(i) == 89) {
      count89++;
    }
  }
  return count89;
}

int main() {

  printf("%d\n", result());

  return 0;
}
