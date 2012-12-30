-- Project Euler, Problem #4
-- Lucas Garron
-- Date: November 23, 2012

import Data.Digits (digits) -- cabal install digits
import Data.List (sort)

-- Code

products :: [Integer]
products = [x*y | x<-num3, y<-num3] where
  num3 = [100..999]

palindromic :: Eq a => [a] -> Bool
palindromic list = (reverse list == list)


result :: Integer
result = maximum $ filter (palindromic . digits 10) products

-- Output

main :: IO ()
main = print result