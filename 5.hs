-- Project Euler, Problem #5
-- Lucas Garron
-- Date: November 23, 2012

-- Code

result :: Integer
result = foldl1 lcm [1..20]

-- Output

main :: IO ()
main = print result