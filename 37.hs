-- Project Euler, Problem #37
-- Lucas Garron
-- Date: December 27, 2012

import Data.Digits (digits, unDigits) -- cabal install digits
import Data.List (inits, tails)
import Data.Numbers.Primes (isPrime) -- cabal install primes

-- Code

isTruncatablePrime :: Integer -> Bool
isTruncatablePrime n = from (tail . inits) && from (init . tails) where
  from headsOrTails = and $ map (isPrime . unDigits 10) $ headsOrTails $ digits 10 n

result :: Integer
result = sum $ take 11 $ filter isTruncatablePrime [10..]

-- Output

main :: IO ()
main = print result