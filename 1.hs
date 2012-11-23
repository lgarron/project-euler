import Data.List

pLimit :: Integer
pLimit = 1000-1 -- *less than* 1000

multiples :: [Integer]
--multiples = [x | x<-[1..999], mod x 3 == 0 || mod x 5 == 0]
multiples = union [3, 6..pLimit] [5, 10..pLimit]

result :: Integer
result = sum multiples

main :: IO ()
main = do print result