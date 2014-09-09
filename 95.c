/* Project Euler, Problem #74
 * Lucas Garron
 * Date: September 02, 2014
 *
 */

#include <assert.h>
#include <stdio.h>

#define MAX_START (1000000)
#define MAX_LINK (1000000)

/*
 * Trial division.
 * `smallestFactor(...)` is originally From Problem 23.
 */
long smallestFactor(long n) {
  int i;
  for (i = 2; i*i <= n; i++) {
    if (n % i == 0) {
      return i;
    }
  }
  return n;
}

/*
 * `divisorSum(...)` is originally From Problem 23.
 */
long divisorSum(long n) {
  long nRemaining = n;
  long result = 1;
  long nextFactor = smallestFactor(nRemaining);

  while (nRemaining > 1) {
    long factor = nextFactor;
    long factorPower = factor;

    nextFactor = smallestFactor(nRemaining / factorPower);
    while (nextFactor == factor) {
      factorPower *= factor;
      nextFactor = smallestFactor(nRemaining / factorPower);
    }

    result *= (factorPower * factor - 1) / (factor - 1); // Math time!
    nRemaining /= factorPower;
  }
  return result - n;
}

// Initialize everything to 0.
int nextLink[MAX_LINK] = {0};

int getNextLink(int n) {
  if (n == 0) { return 0; }
  if (n >= MAX_LINK) { return 0; }
  if (nextLink[n] != 0) { return nextLink[n]; }

  nextLink[n] = divisorSum(n);
  return nextLink[n];
}

/*
 * http://en.wikipedia.org/wiki/Cycle_detection#Brent.27s_algorithm
 * Based on an appropriate from 74.c
 */
int chainLength(int start, int* someCycleLink) {
  int power = 1;
  int lam = 1;

  int tortoise = start;
  int hare = getNextLink(start);
  while (tortoise != hare) {
    if (power == lam) {
      tortoise = hare;
      power *= 2;
      lam = 0;
    }
    hare = getNextLink(hare);
    lam += 1;
  }

  int mu = 0;
  tortoise = start;
  hare = start;

  for (int i = 0; i < lam; i++) {
    hare = getNextLink(hare);
  }

  while (tortoise != hare) {
    tortoise = getNextLink(tortoise);
    hare = getNextLink(hare);
    mu += 1;
  }

  *someCycleLink = hare;

  return lam;
}

int smallestLink(int start, int length) {
  int current = start;
  int smallest = start;

  for (int i = 0; i < length; i++) {
    current = getNextLink(start);
    if (current < start) {
      current = start;
    }
  }

  return smallest;
}

int result() {

  int longest_cycle_length;
  int smallest_link_in_longest_cycle;

  for (int i = 1; i <= MAX_START; i++) {
    int someCycleLink;
    int length = chainLength(i, &someCycleLink);
    if (length > longest_cycle_length) {
      longest_cycle_length = length;
      smallest_link_in_longest_cycle = smallestLink(someCycleLink, length);
      // printf("%d: %d, %d\n", i, length, smallest_link_in_longest_cycle);
    }
  }

  return smallest_link_in_longest_cycle;
}

int main() {

  printf("%d\n", result());

  return 0;
}
