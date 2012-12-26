/* Project Euler, Problem #333
 * Lucas Garron
 * Date: December 25-26, 2012
 *
 * Running time: 35s
 */

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "inc/sieve.h"

#define MAX (1000000)
#define DEBUG false

/*
 * These can be changed to larger numbers for other MAX values,
 * but keeping them small helps with printing
 * the debug tables.
 */
#define POW_I_2 20 // floor(log_2(10^6))+1
#define POW_J_3 13 // floor(log_3(10^6))+1

int powers[POW_I_2][POW_J_3];

/* For each powers[i][j] entry, holds an array with the number
 * of ways to make each integer sum less than MAX,
 * there the specific powers entry was added latest.
 */
int* sums[POW_I_2][POW_J_3];

void initPowers() {
  memset(powers, 0, sizeof(powers));
  int i, j;
  for (i = 0; i < POW_I_2; i++) {
    if (i == 0) {
      powers[i][0] = 1;
    } else {
      int v = 2*powers[i-1][0];
      if (v >= MAX) {
        break;
      }
      powers[i][0] = v;
    }
    for (j = 1; j < POW_J_3; j++) {
      int v = 3*powers[i][j-1];
      if (v >= MAX) {
        break;
      }
      powers[i][j] = v;
    }
  }
  if (DEBUG) {
    printf("-------- POWERS --------\n");
    for (i = 0; i < POW_I_2; i++) {
      for (j = 0; j < POW_J_3; j++) {
        printf("%8d", powers[i][j]);
      }
      printf("\n");
    }
  }
}

void initSums() {
  int i, j;
  for (i = 0; i < POW_I_2; i++) {
    for (j = 0; j < POW_J_3; j++) {
      if (powers[i][j] != 0) {
        int* arr = calloc(MAX, sizeof(int));
        sums[i][j] = arr;
      }
    }
  }
  if (DEBUG) {
    printf("-------- ARRAYS --------\n");
    for (i = 0; i < POW_I_2; i++) {
      for (j = 0; j < POW_J_3; j++) {
        printf("%p ", sums[i][j]);
      }
      printf("\n");
    }
  }
}

/*
 * This adds the number of ways to get each cumulative sum
 * with *to* added latest, onto *from* second-to-latest.
 */
void addSums(int* from, int* to, int add) {
  if (from == NULL) {
    return;
  }
  int k;
  for (k = 0; k < MAX-add; k++) {
      int f = from[k];
      if (f != 0) {
        to[k + add] += f;
        //printf("<%p, %d> From %p, changing %d+%d=%d from %d to %d.\n", to, k+add, from, k, add, k+add, to[k+add] - from[k], f);
      }
  }
}

/* With powers[i][j] as the latest value for a sum,
 * loop over all valid second-to-latest values.
 */
void computeSums(int i, int j) {

  if (powers[i][j] == 0) {
    return;
  }

  if (DEBUG) printf("- Computing sums for 2^%d * 3^%d\n", i, j);

  int v = powers[i][j];
  int* to = sums[i][j];
  to[v] += 1;
  //printf("<%p,%d> Setting %d from %d to %d.\n", to, v, i, j, v, to[v]-1, to[v]);

  int ii, jj;
  for (ii = 0; ii < i; ii++) {
    for (jj = j+1; jj < POW_J_3; jj++) {
      int* from = sums[ii][jj];

      if (from != NULL) {
        //printf("{%p} i: %d, j: %d, ii: %d, jj: %d\n", from, i, j, ii, jj);            
        int k;
        //printf("%d[%d], ", k, sums[ii][jj][k]);
        for (k = 0; k < MAX; k++) {
          if (sums[ii][jj][k]) {
            //printf("%d[%d], ", k, sums[ii][jj][k]);
          }
        }
        //printf("\n");
      }

      addSums(from, to, v);
    }
  }
}

int main() {

  initPowers();
  initSums();
  bool* primeQ = sieve(MAX);

  int i, j;
  for (i = 0; i < POW_I_2; i++) {
    for (j = POW_J_3-1; j >= 0; j--) {
      computeSums(i, j);
    }
  }

  int overall[MAX];

  int k;
  memset(overall, 0, sizeof(overall));
  for (i = 0; i < POW_I_2; i++) {
    for (j = 0; j < POW_J_3; j++) {
      for (k = 0; k < MAX; k++) {
        if (sums[i][j] != NULL) {
          overall[k] += sums[i][j][k];
        }
      }
    }
  }

  int total = 0;
  for (k = 0; k < MAX; k++) {
    if (primeQ[k] && overall[k] == 1) {
      total += k;
    }
  }

  printf("%d\n", total);

  // Free malloced memory.
  for (i = 0; i < POW_I_2; i++) {
    for (j = 0; j < POW_J_3; j++) {
      if (sums[i][j] != NULL) {
        free(sums[i][j]);
      }
    }
  }
  free(primeQ);

  return 0;
}