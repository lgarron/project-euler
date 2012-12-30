-- Project Euler, Problem #7
-- Lucas Garron
-- Date: November 23, 2012

import Data.Numbers.Primes (primes) -- cabal install primes

-- Code

result :: Integer
result = primes !! 10000

-- Output

main :: IO ()
main = print result