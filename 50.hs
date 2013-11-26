-- Project Euler, Problem #50
-- Lucas Garron
-- Date: December 30, 2012

import Data.List (genericDrop, genericLength)
import Data.Numbers.Primes (isPrime, primes)

-- Code

limit :: Integer
limit = 10^6

primeSums :: [Integer]
primeSums = takeWhile (< limit) $ scanl1 (+) primes

partialprimeSums :: Integer -> [Integer]
partialprimeSums len = zipWith (-) (genericDrop len primeSums) primeSums

allowed :: Integer -> Bool
allowed x = x < limit && isPrime x

result :: Integer
result = last $ filter allowed $ concat $ map partialprimeSums [1..genericLength primeSums]

-- Output

main :: IO ()
main = print result