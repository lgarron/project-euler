-- Project Euler, Problem #49
-- Lucas Garron
-- Date: December 30, 2012

import Data.Ord (comparing)
import Data.Digits (digits, unDigits)
import Data.List (elem, permutations)
import Data.Maybe (listToMaybe, mapMaybe)
import Data.Numbers.Primes (isPrime, primes)

-- Code

fourDigitPrimes :: [Integer]
fourDigitPrimes = takeWhile (< 10^4) $ dropWhile (< 10^3) $ primes

concatIntegers :: [Integer] -> Integer
concatIntegers = (unDigits 10) . concat . map (digits 10)

permutationSequence :: Integer -> Maybe Integer
permutationSequence p = listToMaybe [
    concatIntegers [p, mean, p'] |
    p' <- perms,
    p < p',
    let mean = (p + p') `div` 2,
    mean `elem` perms
  ] where
  perms = filter isPrime $ map (unDigits 10) $ permutations (digits 10 p)

--result :: Integer
result = head $ filter (/= 148748178147) $ mapMaybe permutationSequence fourDigitPrimes

-- Output

main :: IO ()
main = print result