# Project Euler, Problem #61
# Lucas Garron
# Date: June 1, 2014

from collections import defaultdict
import sys

K_VALUES = range(3, 9)

HALF = 2
MIN_VALUE = 10**(HALF*2 - 1)
MAX_VALUE = 10**(HALF*2) - 1

def figurate(k):
  i = 0
  value = 0
  values = defaultdict(list)
  while (value <= MAX_VALUE):
    if (value >= MIN_VALUE):
      start, end = divmod(value, 10**HALF)
      values[start] += [end]
    value += 1 + (k-2) * i
    i += 1
  return values

lists = map(figurate, K_VALUES)

def search(lists_used, chain):

  if len(lists_used) == len(K_VALUES):
    if chain[0] == chain[-1]:
      print (10**HALF + 1) * sum(chain[1:])
      sys.exit(0)

  for l in lists:
    if l not in lists_used:
      for end in l[chain[-1]]:
        search(lists_used + [l], chain + [end])

for i in range(10**HALF):
  search([], [i])
