import Data.List

multiples :: [Integer]
--multiples = [x | x<-[1..999], mod x 3 == 0 || mod x 5 == 0]
multiples = union [3, 6..999] [5, 10..999]

result :: Integer
result = sum multiples

main :: IO ()
main = do print result