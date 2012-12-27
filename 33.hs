-- Project Euler, Problem #33
-- Lucas Garron
-- Date: December 27, 2012

import Data.Digits (unDigits) -- cabal install digits
import Data.Ratio (denominator, (%))

-- Code

canAddDigit :: Integer -> Integer -> Bool
canAddDigit i j = (i < j) && or [
  i % j == num[i, k] % num[k, j] ||
  i % j == num[k, i] % num[j, k]
  | k<-[1..9]] where
  num = unDigits 10

result :: Integer
result = denominator $ product [i % j | i<-[1..9], j<-[1..9], canAddDigit i j]

-- Output

main :: IO ()
main = print result