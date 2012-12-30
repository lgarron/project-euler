-- Project Euler, Problem #19
-- Lucas Garron
-- Date: December 21, 2012

import Data.List (genericLength)

-- Code

monthLengths :: [Integer]
monthLengths = cycle (normal ++ normal ++ normal ++ leap) where
  normal = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  leap   = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

result :: Integer
result = genericLength [day | day <- take (12*100) startDays, day == 6] where
  startDays = map (`mod` 7) $ scanl ((+)) firstDay1901 monthLengths
  firstDay1901 = 1 -- Tuesday  

-- Output

main :: IO ()
main = print result