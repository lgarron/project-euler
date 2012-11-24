import Data.List
import Data.Char
import Data.Digits -- cabal install digits

-- Note: This won't spell 0 as "zero".
spellList :: [Integer] -> [String]
spellList [k] = [[], ["one"], ["two"], ["three"], ["four"], ["five"], ["six"], ["seven"], ["eight"], ["nine"]] `genericIndex` k
spellList [1, k] = [["ten"], ["eleven"], ["twelve"], ["thirteen"], ["fourteen"], ["fifteen"], ["sixteen"], ["seventeen"], ["eighteen"], ["nineteen"]] `genericIndex` k
spellList [j, k] = ([[], [], ["twenty"], ["thirty"], ["forty"], ["fifty"], ["sixty"], ["seventy"], ["eighty"], ["ninety"]] `genericIndex` j) ++ (spellList [k])
spellList [i, 0, 0] = (spellList [i]) ++ ["hundred"]
spellList [i, j, k] = (spellList [i]) ++ ["hundred", "and"] ++ (spellList [j, k])
spellList [k, 0, 0, 0] = spellList [k] ++ ["thousand"]

spell :: Integer -> String
spell = intercalate " " . (spellList . (digits 10))

numLetters :: Integer -> Integer
numLetters = genericLength . (filter isLetter . spell)

result :: Integer
result = sum $ map numLetters [1..1000]

main :: IO ()
main = do print result