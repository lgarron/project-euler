# Project Euler, Problem #83
# Lucas Garron
# Date: September 02, 2014

from __future__ import print_function
import sys

# pip install sudoku-solver
from sudokulib.layer import Layer
from sudokulib.backtracking import BacktrackingSolver

def solve(data):
  SOLUTION = ' ' * 81
  solver = BacktrackingSolver()
  # data = "XX3X2X6XX9XX3X5XX1XX18X64XXXX81X29XX7XXXXXXX8XX67X82XXXX26X95XX8XX2X3XX9XX5X1X3XX"
  layer = Layer(data, SOLUTION)

  sol = solver.solve(layer)

  d = list(data)
  for s in sol:
    d[s[0]] = s[1]

  return int("".join(d[:3]))

######## Read Input

total = 0

with open("input/96.txt") as f:
  while f.readline():
    case = ""
    for i in range(9):
      case += f.readline()
    case = case.replace("\n", "")
    case = case.replace("0", "X")
    value = solve(case)
    total += value
    print(value, file=sys.stderr)

print(total)
