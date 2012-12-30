-- Project Euler, Problem #9
-- Lucas Garron
-- Date: November 23, 2012

-- Code

result :: Integer
result = head [a*b*c |
            a<-[1..1000],
            b<-[1..(1000-a)],
            let c=1000-a-b,
            a^2+b^2==c^2
          ]

-- Output

main :: IO ()
main = print result