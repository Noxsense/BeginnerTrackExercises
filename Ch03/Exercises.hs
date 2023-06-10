-- Chapter 03: Types and Typeclasses
module Exercises where

import Prelude

{-|
Exercise: Fill the gaps (underscores), so that the file will typecheck. Your IDE
should yell at you if it doesn't. You can also check your answers against the
type GHC inferred for the same expression using the eval field below.
|-}

-- >>> :t _

a :: [Bool]
a = [True]

b :: (Bool, Bool)
b = (True, False)

c :: [Int]
c = [1, 2, 3]

d :: Int -> Int
d a = a + a

e :: Int -> Int -> Int
e x y = x + y

f :: [Int] -> Int
f = head [1, 2]

g :: ([a] -> a, (a, b) -> a)
g = (head, fst)


{-|
Exercise: Fill in an expression that matches the type. Take advantage of the
typeclasses used.
|-}

-- Example:
h :: Show a => a -> String
h a = show a

i :: Bounded a => (a, a)
i = _

j :: Num a => a -> a
j i = i + 1

k :: (Num b, Integral a) => a -> a -> b
k a0 a1 = (fromIntegral a0) + (fromIntegral a1)
