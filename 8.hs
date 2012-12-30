-- Project Euler, Problem #8
-- Lucas Garron
-- Date: November 23, 2012

import Data.Digits (digits) -- cabal install digits
import ProjectEuler.Subsequences (subsequencesOfLength)

-- Code

parseInput :: String -> Integer
parseInput = read

products :: [Integer] -> [Integer]
products = map product . subsequencesOfLength 5

result :: String -> Integer
result = maximum . products . digits 10 . parseInput

-- Output

main :: IO ()
main = readFile "input/8.txt" >>= print . result