-- Project Euler, Problem #67
-- Lucas Garron
-- Date: June 01, 2014

import Data.Digits (digits) -- cabal install digits
import qualified Data.MemoCombinators as Memo -- cabal install data-memocombinators

-- Code

parseInput :: String -> [[Integer]]
parseInput = map (map read . words) . lines

nextLine :: [Integer] -> [Integer] -> [Integer]
nextLine l1 = zipWith (+) $ zipWith max (l1 ++ [0]) (0:l1)

result :: String -> Integer
result str = maximum $ foldl1 nextLine $ parseInput str

-- Output

main :: IO ()
main = readFile "input/67.txt" >>= print . result