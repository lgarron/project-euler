-- Project Euler, Problem #32
-- Lucas Garron
-- Date: December 26, 2012

import Data.Digits (digits, unDigits) -- cabal install digits
import Data.List (nub, permutations, union)

-- Code

-- The following can be added before the list comprehension to track progress:
--   trace (show permutation) 
-- (It needs import Debug.Trace)

products :: [Integer] -> [Integer]
products permutation = [unDigits 10 c |
  i<-[1..8],
  j<-[1..9-i], -- can actually be replaced with: let j = 5-i,
  let (a, rest) = splitAt i permutation,
  let (b, c) = splitAt j rest,
  (unDigits 10 a) * (unDigits 10 b) == (unDigits 10 c)
  ]

result :: Integer
result = sum . nub . (foldl1 union) $ map products perms where
  perms = permutations [1..9]

-- Output

main :: IO ()
main = print result