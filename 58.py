# Project Euler, Problem #58
# Lucas Garron
# Date: December 01, 2013

import pyprimes

sideLength = 1
numPrimes = 0
numValues = 1

while True:
  sideLength += 2

  d = sideLength - 1
  m = d * d + 1  # Middle value of the three potential primes in the ring.
  for i in [m - d, m, m + d]:
    if pyprimes.isprime(i):
      numPrimes += 1
  numValues += 4

  if numPrimes * 10 < numValues:
    print sideLength
    break
