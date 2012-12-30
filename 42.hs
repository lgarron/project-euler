-- Project Euler, Problem #42
-- Lucas Garron
-- Date: December 28, 2012

import Data.Char (ord)
import Data.List (genericLength)

-- Code

{- Taken from my solution to problem #22. -}
parseInput :: String -> [String]
parseInput str = read $ "[" ++ str ++ "]"

{- Taken from my solution to problem #22. -}
class Score a where
  score :: a -> Integer

instance Score Char where
  score char = toInteger $ ord char - offset where
    offset = ord 'A' - 1

instance Score a => Score [a] where
  score = sum . (map score)

triangularNumbers :: [Integer]
triangularNumbers = [sum [1..n] | n<-[1..]]

{- Now we're just being cute. -}
class Triangular a where
  isTriangular :: a -> Bool

instance Triangular Integer where
  isTriangular n = (n ==) $ head $ filter (>= n) triangularNumbers

instance Score a => Triangular [a] where
  isTriangular = isTriangular . score

result :: String -> Integer
result input = genericLength $ filter isTriangular words where
  words = parseInput input :: [String]

-- Output

main :: IO ()
main = readFile "input/42-words.txt" >>= print . result