-- Project Euler, Problem #58
-- Lucas Garron
-- Date: November 28, 2013

import Data.List (genericLength)
import Data.Numbers.Primes (isPrime)

-- Code

ring :: Integer -> [Integer]
ring i = [m - 2*i, m, m + 2*i] where
  m = 4 * i * i + 1

numPrimes :: [Integer]
numPrimes = scanl1 (+) $ map (genericLength . (filter isPrime) . ring) [1..]

result :: Integer
result = 2 * numRings + 1 where
  f a b = (a * 10) > b
  rings = zipWith f numPrimes [5, 9..]
  numRings = (1 +) $ genericLength $ takeWhile (id) rings

-- Output

main :: IO ()
main = print result