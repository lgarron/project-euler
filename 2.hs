problemMax :: Integer
problemMax = 4*10^6

-- A classic
fib :: [Integer]
fib = 0 : 1 : zipWith (+) fib (tail fib)

lowFib :: [Integer]
lowFib = takeWhile (< problemMax) fib

evenFib :: [Integer]
evenFib = filter even lowFib

result :: Integer
result = sum evenFib

main :: IO ()
main = do print result