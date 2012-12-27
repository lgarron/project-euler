-- Project Euler, Problem #35
-- Lucas Garron
-- Date: December 27, 2012

import Data.Digits (digits, unDigits) -- cabal install digits
import Data.List (genericLength)
import Data.Numbers.Primes (isPrime, primes)

-- Code

rotations :: [a] -> [[a]]
rotations list = trim $ map trim (iterate tail $ cycle list) where
  trim = take (length list)

digitRotations :: Integer -> [Integer]
digitRotations n = map (unDigits 10) $ rotations (digits 10 n)

isCircularPrime :: Integer -> Bool
isCircularPrime = and . (map isPrime) . digitRotations

result :: Integer
result = genericLength [n | n<-(takeWhile (<10^6) primes), isCircularPrime n]

-- Output

main :: IO ()
main = print result