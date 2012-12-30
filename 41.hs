-- Project Euler, Problem #41
-- Lucas Garron
-- Date: December 28, 2012

import Data.Digits (unDigits) -- cabal install digits
import Data.List (permutations)
import Data.Numbers.Primes (isPrime) -- cabal install primes

-- Code

pandigitalPrimes :: Integer -> [Integer]
pandigitalPrimes numDigits = filter isPrime $ map (unDigits 10) $ permutations [1..numDigits]

result :: Integer
result = maximum . concat $ map pandigitalPrimes [1..9]

-- Output

main :: IO ()
main = print result