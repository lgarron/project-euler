-- Project Euler, Problem #52
-- Lucas Garron
-- Date: December 31, 2012

import Data.Digits (digits)
import Data.List (sort)

-- Code

allEqual :: Eq a => [a] -> Bool
allEqual [] = True
allEqual (x:xs) = and $ map (== x) xs

sameDigits :: [Integer] -> Bool
sameDigits list = allEqual $ map (sort . digits 10) list

initMultiples :: Integer -> Integer -> [Integer]
initMultiples n x = map (* x) [1..n]

result :: Integer
result = head $ filter (sameDigits . initMultiples 6) [1..]

-- Output

main :: IO ()
main = print result