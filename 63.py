# Project Euler, Problem #63
# Lucas Garron
# Date: June 1, 2014

def matches():
  for m in range(1, 11):
    for n in range(1, 100):
      if len(str(m**n)) == n:
        yield m**n

print len(list(matches()))