-- Project Euler, Problem #77
-- Lucas Garron
-- Date: September 02, 2014

import Data.Numbers.Primes (primes) -- cabal install primes
import qualified Data.MemoCombinators as Memo -- cabal install data-memocombinator

-- Code

partitionSet :: [Integer]
partitionSet = primes

partitionsRec :: Integer -> Integer -> Integer
partitionsRec = Memo.memo2 Memo.integral Memo.integral partitionsRec' where
  partitionsRec' value minElement
    | value == 0         = 1
    | value < minElement = 0
    | otherwise          = sum $ map (\min -> partitionsRec (value - min) min) mins where
                    mins = takeWhile (<= value) $ dropWhile (< minElement) partitionSet

partitions :: Integer -> Integer
partitions value = partitionsRec value (head partitionSet)

result :: Integer
result = head $ dropWhile ((<= 5000) . partitions) [1..]

-- Output

main :: IO ()
main = print result