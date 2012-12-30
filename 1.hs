-- Project Euler, Problem #1
-- Lucas Garron
-- Date: November 23, 2012

-- Code

isMultiple :: Integer -> Bool
isMultiple x = (x `mod` 3 == 0 || x `mod` 5 == 0)

result :: Integer
result = sum $ filter isMultiple [1..999]

-- Output

main :: IO ()
main = print result