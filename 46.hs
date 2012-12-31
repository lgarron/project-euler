-- Project Euler, Problem #46
-- Lucas Garron
-- Date: December 30, 2012

import Data.Numbers.Primes (isPrime)

-- Code

doubledSquares :: [Integer]
doubledSquares = map ((*2) . (^2)) [1..]

isSum :: Integer -> Bool
isSum n = or $ map (isPrime . (n -)) $ takeWhile (< n) doubledSquares

result :: Integer
result = head $ filter (not . isSum) $ filter (not . isPrime) [3, 5..]

-- Output

main :: IO ()
main = print result