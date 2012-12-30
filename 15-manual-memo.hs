-- Project Euler, Problem #15
-- Lucas Garron
-- Date: November 23, 2012

import Data.List (genericIndex)

-- Code

binomial :: (Integer -> Integer -> Integer) -> Integer -> Integer -> Integer
binomial bRec x 0 = 1
binomial bRec 0 y = 0
binomial bRec x y = (bRec (x-1) (y-1)) + (bRec (x-1) y)

idx2 :: [[a]] -> Integer -> Integer -> a
idx2 list i j = (list `genericIndex` i) `genericIndex` j

binomialMemo :: [[Integer]]
binomialMemo = [[binomial (idx2 binomialMemo) x y | y <- [0..]] | x <- [0..]]

result :: Integer
result = idx2 binomialMemo 40 20

-- Output

main :: IO ()
main = print result