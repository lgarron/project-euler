import Data.List
import Data.Numbers.Primes -- cabal install primes

triangularNumber :: Integer -> Integer
triangularNumber n = n*(n-1) `div` 2

numDivisorsT :: Integer -> Integer
numDivisorsT n = product $ map ((+1) . genericLength) (group $ factors) where
  factors = tail . sort . concat $ map primeFactors [n, n-1]

result :: Integer
result = triangularNumber . head $ filter ((>500) . numDivisorsT) [1..]

main :: IO ()
main = do print result