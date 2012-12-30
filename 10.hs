-- Project Euler, Problem #10
-- Lucas Garron
-- Date: November 23, 2012

import Data.Numbers.Primes (primes) -- cabal install primes

-- Code

result :: Integer
result = sum $ takeWhile (< 2*10^6) primes

-- Output

main :: IO ()
main = print result