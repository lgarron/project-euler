-- Project Euler, Problem #3
-- Lucas Garron
-- Date: November 23, 2012

import Data.Numbers.Primes (primeFactors) -- cabal install primes

-- Code

result :: Integer
result = last $ primeFactors 600851475143

-- Output

main :: IO ()
main = print result