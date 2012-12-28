-- Project Euler, Problem #40
-- Lucas Garron
-- Date: December 28, 2012

import Data.Digits (digits) -- cabal install digits

-- Code

champernowne :: [Integer]
champernowne = (0:) . concat $ map (digits 10) [1..]

result :: Integer
result = product $ map (champernowne !!) (map (10^) [1..6])

-- Output

main :: IO ()
main = print result