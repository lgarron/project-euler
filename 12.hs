import Data.List
import Data.Numbers.Primes -- cabal install primes

triangularNumber :: Integer -> Integer
triangularNumber n = sum [1..n]

numDivisors :: Integer -> Integer
numDivisors n = product $ map ((+1) . genericLength) (group $ primeFactors n)

result :: Integer
result = triangularNumber . head $ filter ((>500) . numDivisors . triangularNumber) [1..]

main :: IO ()
main = do print result