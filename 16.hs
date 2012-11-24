import Data.Digits -- cabal install digits

result :: Integer
result = sum $ digits 10 (2^1000)

main :: IO ()
main = do print result