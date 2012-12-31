-- Project Euler, Problem #32
-- Lucas Garron
-- Date: December 26, 2012

import Data.Digits (digits, unDigits) -- cabal install digits
import Data.List (nub, permutations, union)

import ProjectEuler.Display (displayClause)

-- Code

products :: [Integer] -> [Integer]
products permutation = [unDigits 10 c |
  i<-[1..8],
  let j=5-i, -- i and j can't have fewer or more than 5 digits together.
  let (a, rest) = splitAt i permutation,
  let (b, c) = splitAt j rest,
  (unDigits 10 a) * (unDigits 10 b) == (unDigits 10 c),
  {-IMPURE-}displayClause (a, b, c){-/IMPURE-}
  ]

result :: Integer
result = sum . nub . (foldl1 union) $ map products perms where
  perms = permutations [1..9]

-- Output

main :: IO ()
main = print result