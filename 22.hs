-- Project Euler, Problem #22
-- Lucas Garron
-- Date: December 23, 2012

import Data.Char (ord)
import Data.List (sort)

-- Code

parseInput :: String -> [String]
parseInput str = read $ "[" ++ str ++ "]"

class Score a where
  score :: a -> Integer

instance Score Char where
  score char = toInteger $ ord char - offset where
    offset = ord 'A' - 1

instance Score a => Score [a] where
  score = sum . (map score)

result :: String -> Integer
result input = sum sortedScores where
  sortedScores = zipWith sortedScore [1..] sortedInput :: [Integer]
  sortedScore i str = i * (score str) :: Integer
  sortedInput = sort $ parseInput input :: [String]

-- Output

main :: IO ()
main = readFile "22-names.txt" >>= print . result