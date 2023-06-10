-- Chapter 05: Recursion
module Exercises where

{-|
Exercise: Implement the following functions. Recursion will be neccessary in
order to solve them. You can choose yourself whether to use pattern matching,
guards or case expressions.
|-}


-- 'myReplicate' replicates a value n times (resulting in a list of length n).
myReplicate :: Int -> a -> [a]
myReplicate i = take i . repeat

-- 'runningSum' adds the sum of all previous numbers in a list to the current
-- number. For this implementation, a helper function is neccessary. The helper
-- function is already given in the where clause. Try to understand why it is
-- neccessary.
runningSum :: Num a => [a] -> [a]
runningSum = go 0
  where
    go sum (x:xs) = let sum' = x+sum
                    in sum' : go sum' xs
    go _ [] = []

-- 'takeEverySnd' returns every second element of a list (starting with the first element).
takeEverySnd :: [a] -> [a]
takeEverySnd [] = []
takeEverySnd [a0] = [a0]
takeEverySnd (a0:a1:as) = a0 : takeEverySnd as

-- 'takeEvery' returns every nth element of a list (starting from the first
-- element). You will need to define a helper function, which you can do in the
-- 'where' clause.
takeEvery :: Int -> [a] -> [a]
takeEvery i = go
  where
    go [] = []
    go (x:xs) = x : (go . drop (i-1)) xs

-- 'mergeSort' sorts a list using the merge sort technique. If you are unclear
-- on how that works, feel free to ask google or me. A merging and a splitting
-- helper function will be neccessary.
mergeSort :: Ord a => [a] -> [a]
mergeSort = merge . split
  where
    split :: Ord a => [a] -> ([a], [a])
    split [] = ([], [])
    split [x] = ([x], [])
    split xs = (mergeSort as, mergeSort bs)
      where
        mid = div (length xs)  2
        (as, bs) = splitAt mid xs

    -- while left nonEmpty && right nonEmpty => first left < first right => happend first to result, left rest
    merge :: Ord a => ([a], [a]) -> [a]
    merge ([],[]) = []
    merge (as, []) = as
    merge ([], bs) = bs
    merge (a:as, b:bs) | a < b = a : merge (as, b:bs)
                       | otherwise = b : merge (a:as, bs)

    -- [0, 0, -1] => ([0], [0, -1])
