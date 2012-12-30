/* Project Euler, Problem #408
 * Lucas Garron
 * Date: December 30, 2012
 *
 * Running time: 5s
 */

#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

#define LIMIT (10000000)
#define MODULUS (1000000007)

// We'll need to look up values up to 2*LIMIT
#define NUM_FACT_MOD (2*LIMIT+1)

int factMod[NUM_FACT_MOD];

int timesMod(int a, int b) {
  return (((long) a)*((long) b)) % MODULUS;
}

int minusMod(int m, int s) {
  return (m - s + MODULUS) % MODULUS;
}

void initBinomialMod() {
  factMod[0] = 1;
  int i;
  for (i = 1; i < NUM_FACT_MOD; i++) {
    //if (i % (NUM_FACT_MOD / 10) == 0) printf("%d\n", i);
    factMod[i] = timesMod(factMod[i-1], i);
  }
}

int extendedGCD(int aIn, int bIn, int* aMultiple, int* bMultiple) {
  int a = aIn, b = bIn;
  int x = 0, y = 1;
  int last_x = 1, last_y = 0;
  while (b != 0) {
    int quotient = a / b;
    int remainder = a % b;

    a = b;
    b = remainder;

    int new_x = last_x - quotient*x;
    last_x = x;
    x = new_x;

    int new_y = last_y - quotient*y;
    last_y = y;
    y = new_y;
  }
  //printf("{%d, %d} -> %p, %p --- %d, %d\n", aIn, bIn, aMultiple, bMultiple, last_x, last_y);
  if (aMultiple != NULL) *aMultiple = last_x;
  if (bMultiple != NULL) *bMultiple = last_y;

  return a;
}

// From https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm#Iterative_method_2
int multiplicativeInverse(int n) {
  int inverse;
  extendedGCD(n, MODULUS, &inverse, NULL);
  return minusMod(inverse, 0);
}

int binomialMod(int n, int k) {
  int nMod = n % MODULUS;
  int kMod = k % MODULUS;
  int nMinusKMod = minusMod(n, k);
  long numerator = factMod[nMod];
  long denominator = timesMod(factMod[kMod], factMod[nMinusKMod]);
  long denominatorInverse = multiplicativeInverse(denominator);
  int result = timesMod(numerator, denominatorInverse);
  //printf("[%d, %d] numerator: %ld, denominator: %ld, denominatorInverse: %ld, result: %d\n", n, k, numerator, denominator, denominatorInverse, result);
  return result;
}

#define MAX_INADMISSIBLE (10000) // It's actually 7850.
#define MAX_M (64) // 64 is enough for LIMIT

struct point {
  int x;
  int y;
  int num_admissible_paths_to;
  struct point* mirror;
};

struct point origin = {0, 0, 0, NULL};

struct point inadmissiblePoints[MAX_INADMISSIBLE];
int num_inadmissible_points = 0;

struct point* addInadmissiblePoint(int xIn, int yIn) {
  assert(num_inadmissible_points < MAX_INADMISSIBLE);
  //printf("Adding (%d, %d).\n", xIn, yIn);
  struct point* pt = &inadmissiblePoints[num_inadmissible_points];
  pt->x = xIn;
  pt->y = yIn;
  pt->num_admissible_paths_to = 0;
  pt->mirror = NULL;
  num_inadmissible_points++;
  return pt;
}

void initInadmissiblePoints() {
  int m, n;
  for (m = 1; m < MAX_M; m++) {
    for (n = 1; n < m; n++) {
      bool primitive = (extendedGCD(m, n, NULL, NULL) == 1) && ((m-n) % 2 == 1);
      if (!primitive) {
        continue;
      }

      int a = m*m - n*n;
      int b = 2*m*n;

      int k = 1;
      while (true) {
        int coord1 = a*a*k*k;
        int coord2 = b*b*k*k;
        if (coord1 > LIMIT || coord2 > LIMIT) {
          break;
        }
        struct point* p1 = addInadmissiblePoint(coord1, coord2);
        struct point* p2 = addInadmissiblePoint(coord2, coord1);
        p2->mirror = p1;
        k++;
      }
    }
  }
}

int numPathsBetweenMod(struct point *a, struct point *b) {
  int dx = (b->x) - (a->x);
  int dy = (b->y) - (a->y);
  //printf("- (%d, %d) -> %d\n", dx, dy, binomialMod(dx + dy, dx));
  return binomialMod(dx + dy, dx);
}

int numAdmissiblePathsToMod(struct point *to);

int pathsThroughMod(struct point *first_inadmissible, struct point *to) {
  int between = numPathsBetweenMod(first_inadmissible, to);
  int paths = numAdmissiblePathsToMod(first_inadmissible);
  return timesMod(between, paths);
}

int numAdmissiblePathsToMod(struct point *to) {

  if (to->num_admissible_paths_to != 0) {
    return to->num_admissible_paths_to;
  }

  if (to->mirror != NULL) {
    return numAdmissiblePathsToMod(to->mirror);
  }

  int num = numPathsBetweenMod(&origin, to);
  //printf ("(%d, %d) start: %d\n", to->x, to->y, num);
  int i;
  for (i = 0; i < num_inadmissible_points; i++) {
    struct point* inadmissible = &inadmissiblePoints[i];
    if (inadmissible->x > to->x || inadmissible->y > to->y || (inadmissible->x == to->x && inadmissible->y == to->y)) {
      continue;
    }
    int paths = pathsThroughMod(inadmissible, to);
    //printf ("(%d, %d) subtract: %d\n", to->x, to->y, paths);
    num = minusMod(num, paths);
  }

  //printf ("Calculated to (%d, %d): %d\n", to->x, to->y, num);
  to->num_admissible_paths_to = num;
  return num;
}

int main() {

  initBinomialMod();
  initInadmissiblePoints();

  struct point to = {10000000, 10000000, 0, NULL};
  int result = numAdmissiblePathsToMod(&to);

  printf("%d\n", result);

  return 0;
}