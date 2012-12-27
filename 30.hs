-- Project Euler, Problem #30
-- Lucas Garron
-- Date: December 26, 2012

import Data.Digits (digits) -- cabal install digits

-- Code

isDigitPowerSum :: Integer -> Integer -> Bool
isDigitPowerSum k n = (sum $ map (^ k) $ digits 10 n) == n

result :: Integer
result = sum [n | n<-[2..10^6], isDigitPowerSum 5 n]

-- Output

main :: IO ()
main = do print result