-- Project Euler, Problem #6
-- Lucas Garron
-- Date: November 23, 2012

-- Code

result :: Integer
result = squaredSum - sumOfSquares where
  squaredSum = (sum [1..100])^2
  sumOfSquares = sum $ map (^2) [1..100]

-- Output

main :: IO ()
main = print result