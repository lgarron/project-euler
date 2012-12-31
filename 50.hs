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

partialprimeSums :: Integer -> [(Integer, Integer)]
partialprimeSums len = filter primeDifference $ zip primeSums (genericDrop len primeSums) where
  primeDifference (x, y) = isPrime (y-x) && (y-x < limit)

result :: Integer
result = uncurry (flip (-)) $ last $ concat $ map partialprimeSums [1..genericLength primeSums]

-- Output

main :: IO ()
main = print result