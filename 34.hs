-- Project Euler, Problem #33
-- Lucas Garron
-- Date: December 27, 2012

import Data.Digits (digits) -- cabal install digits

import ProjectEuler.Progress (displayClause)

-- Code

factorial :: Integer -> Integer
factorial n = product [1..n]

curious :: Integer -> Bool
curious n = sum (map factorial $ digits 10 n) == n

{- Calculate the point at which the digits cannot
   contribute enough to add up to the number anymore. -}
maxValue :: Integer
maxValue = head [j | k<-[1..], let j = (k+1) * factorial 9, j < 10^k]

result :: Integer
result = sum [i | i<-[3..maxValue], curious i, {-IMPURE-}displayClause i{-/IMPURE-}]

-- Output

main :: IO ()
main = print result