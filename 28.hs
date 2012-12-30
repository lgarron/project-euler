-- Project Euler, Problem #28
-- Lucas Garron
-- Date: December 26, 2012

-- Code

result :: Integer
result = 1 + 4 * sum [4 * x^2 + x + 1 | x <-[1..500]]

-- Output

main :: IO ()
main = print result