-- Project Euler, Problem #18
-- Lucas Garron
-- Date: December 20, 2012

import Data.Digits -- cabal install digits
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
main = readFile "18_in.txt" >>= print . result