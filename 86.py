# Project Euler, Problem #86
# Lucas Garron
# Date: September 02, 2014


######## Pythagorean Tripet Traversal ########

# This works as long as you're looking among
# Pythagorean triplets under some obvious monotonic limit
# (e.g. a simple linear-ish function of the sides).

# http://en.wikipedia.org/wiki/Tree_of_primitive_Pythagorean_triples#Alternative_methods_of_generating_the_tree
matrixEntries = [
  [2,-1, 1, 0],
  [2, 1, 1, 0],
  [1, 2, 0, 1]
]

# mat is a flat list of 2x2 entries in row-major order
def multiply(mat, u, v):
  return (mat[0]*u + mat[1]*v), (mat[2]*u + mat[3]*v)

def traverse(u, v, fn, tooLarge):
  a = aPrimitive = u*v
  b = bPrimitive = (u*u - v*v) / 2
  c = cPrimitive = (u*u + v*v) / 2

  if tooLarge(a, b, c):
    return

  while not tooLarge(a, b, c):
    fn(a, b, c)
    a += aPrimitive
    b += bPrimitive
    c += cPrimitive

  for matrix in matrixEntries:
    newU, newV = multiply(matrix, u, v)
    traverse(newU, newV, fn, tooLarge)


LIMIT = 2000

cuboids = [[] for i in range(LIMIT + 1)]

def splitA(a, b, c):
  # Suppose we turn a, b, c into the cuboid [i, a-i, b].
  # c will remain the shortest diagonal iff
  #   i <= b
  #   a - i <= b (=> i >= a - b)
  # We might as well also only take i <= a/2 to avoid duplicates.

  lowerInclusive = max(a - b, 1)
  upperInclusive = min(b, int(a/2))
  for i in range(lowerInclusive, upperInclusive + 1):
    cuboid = list(reversed(sorted([i, a-i, b])))
    x, _, _ = cuboid

    if x <= LIMIT:
      cuboids[x].append(cuboid)

def fn(a, b, c):
  # print(a, b, c)
  splitA(a, b, c)
  splitA(b, a, c)

def tooLarge(a, b, c):
  return (a > 2*LIMIT) or (b > 2*LIMIT) or (a > LIMIT and b > LIMIT)

traverse(3, 1, fn, tooLarge)

# print([item for sublist in cuboids for item in sublist])
# print(sum(map(len, cuboids)))


MIN_NUM_SOLUTIONS = 10**6

cumulative_sum = 0
for c in cuboids:
  cumulative_sum += len(c)
  if cumulative_sum > MIN_NUM_SOLUTIONS:
    print c[0][0]
    break

