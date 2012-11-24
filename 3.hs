import Data.Numbers.Primes -- cabal install primes

result :: Integer
result = last $ primeFactors 600851475143

main :: IO ()
main = do print result