-- Project Euler, Problem #51
-- Lucas Garron
-- Date: December 31, 2012

import Data.Digits (digits, unDigits)
import Data.List (genericLength, nub)
import Data.Numbers.Primes (isPrime, primes)

-- Code

replace :: Eq a => a -> a -> [a] -> [a]
replace x y [] = []
replace x y (z:zs) = newHead : (replace x y zs) where
  newHead = if (z == x) then y else z

familySize :: Integer -> Integer
familySize p = maximum $ map genericLength $ map replaceDigit (nub pDigits) where
  replaceDigit :: Integer -> [Integer]
  replaceDigit d = [num | new <- [d..9], let num = unDigits 10 $ replace d new pDigits, isPrime num]
  pDigits = digits 10 p :: [Integer]

result :: Integer
result = head $ filter ((== 8) . familySize) primes

-- Output

main :: IO ()
main = print result