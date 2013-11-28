-- Project Euler, Problem #55
-- Lucas Garron
-- Date: November 28, 2013

import Data.List (genericLength)
import Data.Digits (digits, unDigits) -- cabal install digits

-- Code

maxIterations :: Integer
maxIterations = 50

bound :: Integer
bound = 10^4

isPalindromic :: Eq a => [a] -> Bool
isPalindromic list = (reverse list == list)

isLychrel :: Integer -> Bool
isLychrel x = f (iterateOnce x) maxIterations where
  iterateOnce x = x + (unDigits 10 $ reverse $ digits 10 x)
  f x i
    | i == 0 = True
    | isPalindromic (digits 10 x) = False
    | otherwise = f (iterateOnce x) (i - 1)

result :: Integer
result = genericLength [x | x <-[1..bound], isLychrel x]

-- Output

main :: IO ()
main = print result