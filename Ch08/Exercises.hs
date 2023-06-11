-- Chapter 08: Making Our Own Types and Typeclasses
module Exercises where

{-|
Exercise: Peano defined natural numbers by means of 0 and successors of it.
Define a data type that represents this idea using a constructor for zero and
one for the successor of a number.
|-}

data Nat = Zero | Succ Nat
  deriving ( Show )

{-|
Exercise: Define 'plus', which acts recursively on two natural numbers and
returns their sum.
|-}

plus :: Nat -> Nat -> Nat
plus Zero x = x
plus (Succ Zero) x = Succ x -- +1
plus (Succ a) b = Succ (plus a b) -- +n = +1 + 1 .. +1


{-|
Exercise: Define an Eq instance for your Peano numbers.
|-}

instance Eq Nat where
  (==) :: Nat -> Nat -> Bool
  (==) Zero Zero = True
  (==) (Succ b) Zero = False
  (==) (Succ b) (Succ a) = a == b

{-|
Exercise: Define a class that allows casting to and from Int. Your functions
should also make it possible to mark a cast as impossible (for example when
casting a negative integer to a natural number). Make an instance for your
natural number type.
|-}

class FooBarInt a where
  toInt :: a -> Int
  fromInt :: Int -> a

instance FooBarInt Nat where
  toInt :: Nat -> Int
  toInt Zero = 0
  toInt (Succ a) = 1 + toInt a

  fromInt :: Int -> Nat
  fromInt i
    | i == 0 = Zero
    | i > 0 = Succ (fromInt (i-1))
    | otherwise = undefined
