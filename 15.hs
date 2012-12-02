import qualified Data.MemoCombinators as Memo -- cabal install data-memocombinators

binomial :: Integer -> Integer -> Integer
binomial = Memo.memo2 Memo.integral Memo.integral binomial' where
  binomial' x 0 = 1
  binomial' 0 y = 0
  binomial' x y = (binomial (x-1) (y-1)) + (binomial (x-1) y)

result :: Integer
result = binomial 40 20

main :: IO ()
main = do print result