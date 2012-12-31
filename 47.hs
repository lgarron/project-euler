-- Project Euler, Problem #47
-- Lucas Garron
-- Date: December 30, 2012

import Data.List (genericLength, group)
import Data.Numbers.Primes (primeFactors)
import ProjectEuler.Subsequences (subsequencesOfLength)

-- Code

-- This seems to get memoized properly in GHC 7.4.2.
numFactors :: Integer -> Integer
numFactors = genericLength . group . primeFactors

result :: Integer
result = head . head $ filter fourFactorsEach $ subsequencesOfLength 4 [1..] where
  fourFactorsEach = and . map ((== 4) . numFactors)

-- Output

main :: IO ()
main = print result