-- Project Euler, Problem #45
-- Lucas Garron
-- Date: December 30, 2012

import Data.List (intersect)

-- Code

triangularNumbers :: [Integer]
triangularNumbers = [n*(n+1) `div` 2 | n<-[1..]]

pentagonalNumbers :: [Integer]
pentagonalNumbers = [n*(3*n-1) `div` 2 | n<-[1..]]

hexagonalNumbers :: [Integer]
hexagonalNumbers = [n*(2*n-1) | n<-[1..]]

intersection :: [Integer]
intersection = combine triangularNumbers pentagonalNumbers hexagonalNumbers where
  combine (a:ax) (b:bx) (c:cx) 
    | a == b && b == c = (a : combine ax bx cx)
    | a <= b && a <= c = combine ax (b:bx) (c:cx)
    | b <= a && b <= c = combine (a:ax) bx (c:cx)
    | otherwise        = combine (a:ax) (b:bx) cx

result :: Integer
result = head . tail . tail $ intersection

-- Output

main :: IO ()
main = print result