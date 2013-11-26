-- Project Euler, Problem #54
-- Lucas Garron
-- Date: January 24, 2013

-- Code

parseInput :: String -> [([Card], [Card])]
parseInput = map (splitAt 5 . map read . words) . lines

data Value = Value Integer deriving Show
data Suit = Clubs | Diamonds | Hearts | Spades deriving Show
data Card = Card Value Suit deriving Show

instance Read Value where
  readsPrec _ "" = []
  readsPrec _ str = case head str of
    '2' -> [(Value 2, tail str)]
    '3' -> [(Value 3, tail str)]
    '4' -> [(Value 4, tail str)]
    '5' -> [(Value 5, tail str)]
    '6' -> [(Value 6, tail str)]
    '7' -> [(Value 7, tail str)]
    '8' -> [(Value 8, tail str)]
    '9' -> [(Value 9, tail str)]
    'T' -> [(Value 10, tail str)]
    'J' -> [(Value 11, tail str)]
    'Q' -> [(Value 12, tail str)]
    'K' -> [(Value 13, tail str)]
    'A' -> [(Value 14, tail str)]
    _   -> []

instance Read Suit where
  readsPrec _ "" = []
  readsPrec _ str = case head str of
    'C' -> [(Clubs, tail str)]
    'D' -> [(Diamonds, tail str)]
    'H' -> [(Hearts, tail str)]
    'S' -> [(Spades, tail str)]
    _   -> []

instance Read Card where
  readsPrec _ str = [(Card (read [head str] :: Value) (read [str !! 1] :: Suit), drop 2 str)]

--result :: String -> Integer
result str = parseInput str

-- Output

main :: IO ()
main = readFile "input/54.txt" >>= print . result