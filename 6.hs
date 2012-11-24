result :: Integer
result = (sum [1..100])^2 - (sum $ map (^2) [1..100])

main :: IO ()
main = do print result