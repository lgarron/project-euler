-- Project Euler, Problem #2
-- Lucas Garron
-- Date: November 23, 2012

-- Code

-- A classic
fib :: [Integer]
fib = 0 : 1 : zipWith (+) fib (tail fib)

result :: Integer
result = sum $ filter even $ takeWhile (< 4*10^6) fib

-- Output

main :: IO ()
main = print result