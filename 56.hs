-- Project Euler, Problem #56
-- Lucas Garron
-- Date: November 28, 2013

import Data.Digits (digits)

-- Code

result :: Integer
result = maximum [sum . digits 10 $ a^b | a <- [1..100], b <- [1..100]]

-- Output

main :: IO ()
main = print result