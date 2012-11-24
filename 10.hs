import Data.Numbers.Primes -- cabal install primes

result :: Integer
result = sum $ takeWhile (< 2*10^6) primes

main :: IO ()
main = do print result