module ProjectEuler.Display (display, displaying, displayClause, displayIf, displayingIf) where

import Data.Maybe (isJust)
import Debug.Trace (traceShow)

{-
  Keep in mind: These functions to not affect lazy evaluation.
-}

{-
  Wrapper for traceShow.
-}
display :: Show a => a -> b -> b
display = traceShow

{- 
  Display the a value, then passes it on.
-}
displaying :: Show a => a -> a
displaying x = display x x

{-
  For use as a clause in a list comprehensions, to show what values have been reached.
  (Using `displaying` on the left side of the pipe also works, but prints lazy.)
-}
displayClause :: Show a => a -> Bool
displayClause x = display x True

{-
  Useful for printing out values as they're being filtered.
-}

class DisplayIf b where
  -- TODO: Handle the cases better, write better tests.
  displayIf :: Show a => (a -> b) -> a -> b
  displayIf f x = if (shouldDisplay value) then (display x value) else value where
    value = f x
  displayingIf :: Show a => (a -> b) -> a -> a
  displayingIf f x = if (shouldDisplay $ f x) then (displaying x) else x
  shouldDisplay :: b -> Bool

instance DisplayIf Bool where
  shouldDisplay = id

instance DisplayIf (Maybe a) where
  shouldDisplay = isJust