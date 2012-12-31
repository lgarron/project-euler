import ProjectEuler.Display (display, displaying, displayClause, displayIf)

import Data.Maybe (listToMaybe, mapMaybe)

{-
  Note: This needs to be run using:
  runghc -i.. DisplayTest.hs
-}


displayTest :: String
displayTest = display "Testing display" "displayTest"

displayingTest :: String
displayingTest = displaying "displayingTest"

displayClauseTest :: String
displayClauseTest = head [str | str<-strings, length str == 17, displayClause str] where
  strings = ["displayClauseTest", "Testing displayClause"]

displayIfBoolTest :: String
displayIfBoolTest = head $ filter (displayIf $ (== 17) . length) strings where
  strings = ["displayIfBoolTest", "Testing displayIf"]

displayIfMaybeTest :: String
displayIfMaybeTest = head $ mapMaybe (displayIf listToMaybe) strings where
  strings = [["displayIfMaybeTest"], [], ["Testing displayIf"]]

main :: IO ()
main = print [displayTest, displayingTest, displayClauseTest, displayIfBoolTest, displayIfMaybeTest]