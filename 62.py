# Project Euler, Problem #62
# Lucas Garron
# Date: June 1, 2014

from collections import defaultdict
import itertools

digits_to_cubes = defaultdict(list)

for i in itertools.count():
  cube = i ** 3
  digits = ''.join(sorted(str(cube)))
  d = digits_to_cubes[digits]
  d += [cube]
  if (len(d) >= 5):
    # The problem actually asks for *exactly* 5 permutations, but this works.
    print min(d)
    break
