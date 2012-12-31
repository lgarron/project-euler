module ProjectEuler.Progress (display, displaying, displayClause, displayIfTrue) where

import Debug.Trace (traceShow)

display :: Show a => a -> b -> b
display = traceShow

displaying :: Show a => a -> a
displaying x = display x x

displayClause :: Show a => a -> Bool
displayClause x = display x True

displayIfTrue :: Show a => (a -> Bool) -> a -> Bool
displayIfTrue f x = traceShowIfTrue' value value where
  traceShowIfTrue' True = traceShow x
  traceShowIfTrue' False = id
  value = f x
