import Data.Numbers.Primes -- cabal install primes

result :: Integer
result = primes !! 10000

main :: IO ()
main = do print result