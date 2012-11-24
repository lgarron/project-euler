result :: Integer
result = foldl1 lcm [1..20]

main :: IO ()
main = do print result