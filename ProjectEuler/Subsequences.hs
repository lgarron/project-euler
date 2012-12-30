module ProjectEuler.Subsequences (subsequencesOfLength) where

subsequencesOfLength :: Integer -> [a] -> [[a]]
subsequencesOfLength 0 _ = repeat []
subsequencesOfLength i list = zipWith (:) list (subsequencesOfLength (i-1) (tail list))