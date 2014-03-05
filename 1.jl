# Project Euler, Problem #1
# Lucas Garron
# Date: March 05, 2014

tic()
answer = sum(filter(x -> x % 5 == 0 || x % 3 == 0, 1:999))
toc()

print(answer)