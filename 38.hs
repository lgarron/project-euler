-- Project Euler, Problem #38
-- Lucas Garron
-- Date: December 28, 2012

import Data.Digits (digits, unDigits) -- cabal install digits
import Data.List (inits, sort, tail)
import Data.Maybe (listToMaybe, mapMaybe)

-- Code

pandigitalMultiple :: Integer -> Maybe Integer
pandigitalMultiple n = listToMaybe pandigitalNumbers where
  pandigitalNumbers = map (unDigits 10) pandigitals :: [Integer]
  pandigitals = filter ((== [1..9]) . sort) shortEnoughConcats :: [[Integer]]
  shortEnoughConcats = takeWhile ((<10) . length) multipleConcats :: [[Integer]]
  multipleConcats = map concat $ tail . inits $ multiples :: [[Integer]]
  multiples = map (digits 10 . (*n)) [1..] :: [[Integer]]

result :: Integer
result = maximum $ mapMaybe pandigitalMultiple [1..9999]

-- Output

main :: IO ()
main = print result