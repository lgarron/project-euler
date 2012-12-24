-- Project Euler, Problem #26
-- Lucas Garron
-- Date: December 23, 2012

import Data.List(nub, maximumBy, (\\))
import Data.Numbers.Primes (primeFactors) -- cabal install primes
import Data.Ord (comparing)

-- Code

cycleLength :: Integer -> Integer
cycleLength n = cycleLength' 10 pureN where
  pureN = product $ (nub $ primeFactors n) \\ [2, 5]
  cycleLength' p 1 = 0
  cycleLength' p n = if (p-1)`mod` n == 0 then 1 else 1 + cycleLength' (p*10) (n)

result :: Integer
result = maximumBy (comparing cycleLength) [1..999]

-- Output

main :: IO ()
main = do print result