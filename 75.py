# Project Euler, Problem #75
# Lucas Garron
# Date: September 02, 2014


# http://en.wikipedia.org/wiki/Tree_of_primitive_Pythagorean_triples#Alternative_methods_of_generating_the_tree
matrixEntries = [
  [2,-1, 1, 0],
  [2, 1, 1, 0],
  [1, 2, 0, 1]
]

# mat is a flat list of 2x2 entries in row-major order
def multiply(mat, u, v):
  return (mat[0]*u + mat[1]*v), (mat[2]*u + mat[3]*v)

def traverse(u, v, fn, maxSum):
  a = aPrimitive = u*v
  b = bPrimitive = (u*u - v*v) / 2
  c = cPrimitive = (u*u + v*v) / 2

  if a+b+c > maxSum:
    return

  while a+b+c <= maxSum:
    fn(a, b, c)
    a += aPrimitive
    b += bPrimitive
    c += cPrimitive

  for matrix in matrixEntries:
    newU, newV = multiply(matrix, u, v)
    traverse(newU, newV, fn, maxSum)

L = {}

def fn(a, b, c):
  sum = a + b + c
  L[sum] = L.get(sum, 0) + 1
  # print(a, b, c, sum, L[sum])

traverse(3, 1, fn, 1500000)

count = 0
for l, num in L.iteritems():
  if num == 1:
    count += 1

print count