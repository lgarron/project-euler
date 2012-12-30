-- Project Euler, Problem #11
-- Lucas Garron
-- Date: November 23, 2012

import Data.List

-- Code

parseInput :: String -> [[Integer]]
parseInput = map (map read . words) . lines

-- From Problem 8.
subseqLength :: Integer -> [a] -> [[a]]
subseqLength 0 _ = repeat []
subseqLength i list = zipWith (:) list (subseqLength (i-1) (tail list))

-- Converts a rectangular array like [[1, 2], [3, 4]] to [[1],[2,3],[4]].
diagonals :: [[a]] -> [[a]]
diagonals = diagonalsHelper []
              where
                diagonalsHelper ([]:[]) [] = []
                diagonalsHelper ([]:xs) [] = diagonalsHelper xs []
                diagonalsHelper [] (y:ys) = diagonalsHelper [y] ys
                diagonalsHelper xs [] = (map head xs) : (diagonalsHelper (map tail xs) [])
                diagonalsHelper xs (y:ys) = (map head xs) : (diagonalsHelper ((map tail xs) ++ [y]) ys)

-- Find the maximum product of any subsequence (of length 4) of any sublist.
max4 :: [[Integer]] -> Integer
max4 = maximum . map product . concatMap (subseqLength 4)

-- Find the maximum 
result :: String -> Integer
result input = maximum $ map max4 [arr, transpose arr, diagonals arr, diagonals $ reverse arr] where
    arr = parseInput input

-- Output

main :: IO ()
main = readFile "input/11.txt" >>= print . result