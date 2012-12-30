-- Project Euler, Problem #43
-- Lucas Garron
-- Date: December 29, 2012

import Data.Digits (unDigits)
import Data.List (permutations)
import Data.Numbers.Primes (primes) -- cabal install primes
import ProjectEuler.Subsequences (subsequencesOfLength)

-- Code

verify :: [Integer] -> Bool
verify list = and $ zipWith isMultiple primes subNumbers where
  isMultiple d n = (n `mod` d == 0)
  subNumbers = tail $ map (unDigits 10) $ subsequencesOfLength 3 list

-- This brute-force search doesn't prune by short-circuiting the verification, but it's fast enough.
result :: Integer
result = sum $ map (unDigits 10) $ filter verify $ permutations [0..9]

-- Output

main :: IO ()
main = print result