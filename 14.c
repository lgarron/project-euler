#include <stdio.h>
#include <limits.h>

#define OVERFLOW_MAX (LONG_MAX)

#define MAX (1000000)
#define MEMO_LIMIT (10*MAX)
long memo[MEMO_LIMIT];

long collatz_length(long n) {
  if (n <= 1) {
    return 0;
  }
  if (n < MEMO_LIMIT && memo[n] != 0) {
    return memo[n];
  }
  if (n % 2 == 0 && n > (OVERFLOW_MAX-1)/3) {
    fprintf(stderr, "Overflow detected! Value: %ld > (%ld-1)/3\n", n, OVERFLOW_MAX);
  }
  long next = (n % 2 == 0) ? n/2 : 3*n+1;
  long value = 1 + collatz_length(next);
  if (n < MEMO_LIMIT) {
    memo[n] = value;
  }
  return value;
}

int main(int argc, char* argv[]) {

  long i;
  for (i = 0; i < MEMO_LIMIT; i++) {
    memo[i] = 0;
  }

  long max=0;
  long maxN=0;

  for (i = 1; i < MAX; i++) {
    long value = collatz_length(i);
    //printf("%ld, %ld\n", i, value);
    if (value > max) {
      max = value;
      maxN = i;
    }
  }

  printf("%ld\n", maxN);

  return 0;
}