-- Project Euler, Problem #13
-- Lucas Garron
-- Date: November 23, 2012

import Data.Digits (digits, unDigits) -- cabal install digits

-- Code

parseInput :: String -> [Integer]
parseInput = map read . lines

result :: String -> Integer
result input = unDigits 10 $ take 10 $ digits 10 (sum numbers) where
  numbers = parseInput input

-- Output

main :: IO ()
main = readFile "input/13.txt" >>= print . result