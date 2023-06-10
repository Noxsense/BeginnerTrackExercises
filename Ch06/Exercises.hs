-- Chapter 06: Higher order functions
module Exercises where

{-|
Exercise: What is the type of the following expressions? Use the prompt below to
find the type of predifined functions.
|-}

-- >>> :t even

a :: (a -> b) -> [a] -> [b]
a = map

b :: a -> [a]
b = replicate 3

c :: Int -> Int
c = (1 +)

d :: Integer -> Integer
d = (\x -> \y -> x) 3

e :: [a] -> [Bool]
e = map (const False)

f :: Integral a => [a] -> [a]
f = filter even

g :: Integer -> [Integer] -> Integer
g = foldr (+)

h :: Integral a => a -> Bool
h = (even $)

i :: Integral a => [a] -> [a]
i = filter even . map (+1)

j :: (a -> [a]) -> a -> [Bool]
j = (map (const True) .)

{-|
Exercise: Implement the following functions using foldr.
|-}

-- 'myLength' returns the length of a list.
myLength :: [a] -> Int
myLength = length

-- 'myFilter' behaves like 'filter'.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter = filter

-- 'mapIf' applies a function only if a condition is true, otherwise, the value is left unchanged.
mapIf :: (a -> Bool) -> (a -> a) -> [a] -> [a]
mapIf = mapIf'
  where
   mapIf' f m = map (\x -> if f x then m x else x)

-- 'stretch' stretches a list by repeating each element once, e.g. [1,2,3] -> [1,1,2,2,3,3]
stretch :: [a] -> [a]
stretch = foldr (\i all -> i: i: all) []
