-- Project Euler, Problem #19
-- Lucas Garron
-- Date: December 21, 2012

import Data.List (genericLength)
import Data.Time (fromGregorian, Day)
import Data.Time.Calendar.WeekDate (toWeekDate)

-- Code

-- Help from http://rosettacode.org/wiki/Day_of_the_week#Haskell
isSunday :: Day -> Bool
isSunday day = wday == 7
    where (_,_,wday) = toWeekDate day
 
result :: Integer
result = genericLength $ filter isSunday days where
  days = [fromGregorian year month 1 | year <- [1901..2000], month <- [1..12]]

-- Output

main :: IO ()
main = print result