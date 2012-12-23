-- Project Euler, Problem #20
-- Lucas Garron
-- Date: December 23, 2012

import Data.Digits -- cabal install digits

-- Code

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)
 
result :: Integer
result = sum $ digits 10 $ factorial 100

-- Output

main :: IO ()
main = print result