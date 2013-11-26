# Project Euler, Problem #50
# Lucas Garron
# Date: November 26, 2013

from __future__ import print_function
import itertools
import pyprimes

MAX = 10 ** 6

primes = list(itertools.takewhile(lambda x: x < MAX, pyprimes.primes()))

# No itertools.accumulate in Python 2...
partialSums = []
partialSum = 0
for p in primes:
  partialSum += p
  partialSums.append(partialSum)

numPrimes = len(primes)

recordLength = 0
record = None

for i in range(numPrimes):
  for j in range(i, numPrimes):
    d = partialSums[j] - partialSums[i]
    if d < MAX and pyprimes.isprime(d):
      if j - i > recordLength:
        recordLength = j - i
        record = d
        print(recordLength, record)
