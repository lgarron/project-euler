-- Project Euler, Problem #36
-- Lucas Garron
-- Date: December 27, 2012

import Data.Digits (digits) -- cabal install digits
import Data.List (genericLength)

-- Code

isPalindromic :: Eq a => [a] -> Bool
isPalindromic list = (reverse list == list)

isPalindromicNumber :: Integer -> Integer -> Bool
isPalindromicNumber base = isPalindromic . digits base

result :: Integer
result = sum [n | n<-[1..10^6-1], isPalindromicNumber 10 n, isPalindromicNumber 2 n]

-- Output

main :: IO ()
main = print result