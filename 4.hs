import Data.Digits -- cabal install digits
import Data.List

num3 :: [Integer]
num3 = [100..999]

products :: [Integer]
products = [x*y | x<-num3, y<-num3]

palindromic :: Eq a => [a] -> Bool
palindromic list = (reverse list == list)

palindromes :: [Integer]
palindromes = filter (palindromic . (digits 10)) products

result :: Integer
result = last $ sort palindromes

main :: IO ()
main = do print result