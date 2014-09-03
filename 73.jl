# Project Euler, Problem #4
# Lucas Garron
# Date: March 05, 2014

function numFractionsBetween(a, b, c, d, maxDenominator)
  if b + d > maxDenominator
    return 0
  else
    1 + numFractionsBetween(a, b, a+c, b+d, maxDenominator) + numFractionsBetween(a+c, b+d, c, d, maxDenominator)
  end
end

answer = numFractionsBetween(1, 3, 1, 2, 12000)

print(answer)