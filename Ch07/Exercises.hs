-- Chapter 07: Modules
module Exercises where

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

keySet :: _
keySet = _

{-|
Exercise: Implement 'union' for lists using
(1) At most 'delete', (:), and 'foldr'
(2) At most 'filter', intersect', (++) and 'nub'
|-}

union1 :: _
union1 = _

union2 :: _
union2 = _

{-|
Exercise: Export all functions you have defined in this module explicitly.
|-}
