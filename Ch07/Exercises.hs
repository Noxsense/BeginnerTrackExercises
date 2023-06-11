-- Chapter 07: Modules
module Exercises
 ( wordCount
 , keySet
 , union1
 , union2
 ) where

import Data.Map (Map, keys)
import Data.Set (Set, fromList)
import Data.List (intersect, nub, delete)

{-|
Exercise: Using the functions you just learned about, implement a function that
counts the number of words in a text.
|-}

wordCount :: String -> Int
wordCount = length . words

{-|
Exercise: Using Data.Map and Data.Set, implement a function that converts a Map
to a Set of keys.
|-}

keySet :: Ord a => Map a b -> Set a
keySet = fromList . keys

{-|
Exercise: Implement 'union' for lists using
(1) At most 'delete', (:), and 'foldr'
(2) At most 'filter', intersect', (++) and 'nub'
|-}

union1 :: Eq a => [a] -> [a] -> [a]
union1 as [] = as
union1 [] (bs) = distinct' bs
union1 (a:as) (bs) = a : union1 as bs'
  where
    bs' = foldr (\i acc -> delete a (i : acc)) [] (distinct' bs)

-- (1) At most 'delete', (:), and 'foldr'
-- not exported.
distinct' :: Eq a => [a] -> [a]
distinct' [] = []
distinct' (x:xs) = x : distinct' (foldr (\i acc -> delete x (i:acc)) [] xs)

union2 :: Eq a => [a] -> [a] -> [a]
union2 as [] = as
union2 [] (b:bs) = [b] ++ union2 [] (filter (/= b) bs) -- aka distinct''
union2 as (b:bs) = as ++ union2 [] (filter (`notElem` as) bs)

{-|
Exercise: Export all functions you have defined in this module explicitly.
|-}
