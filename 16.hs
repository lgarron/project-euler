-- Project Euler, Problem #16
-- Lucas Garron
-- Date: November 23, 2012

-- Code

import Data.Digits (digits) -- cabal install digits

result :: Integer
result = sum $ digits 10 (2^1000)

-- Output

main :: IO ()
main = print result