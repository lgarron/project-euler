-- Project Euler, Problem #8
-- Lucas Garron
-- Date: November 23, 2012

import Data.Digits -- cabal install digits

-- Code

parseInput :: String -> Integer
parseInput = read

subseqLength :: Integer -> [a] -> [[a]]
subseqLength 0 _ = repeat []
subseqLength i list = zipWith (:) list (subseqLength (i-1) (tail list))

products :: [Integer] -> [Integer]
products = map product . subseqLength 5

result :: String -> Integer
result = maximum . products . digits 10 . parseInput

-- Output

main :: IO ()
main = readFile "input/8.txt" >>= print . result