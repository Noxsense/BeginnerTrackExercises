-- Chapter 04: Syntax in Functions
module Exercises where

{-|
Exercise: Implement the following two functions using:
(1) Pattern matching
(2) Guards
(3) A 'case' Expression
|-}


-- The functions 'and*' should evaluate to the following:
-- and True True -> True
-- and False True -> False
-- and True False -> False
-- and False False -> False

andPat :: Bool -> Bool -> Bool
andPat True True = True
andPat _ _  = False

andGuard :: Bool -> Bool -> Bool
andGuard a b | a == b && a == True = True
             | otherwise = False

andCase :: Bool -> Bool -> Bool
andCase a b = case (a, b) of
  (True, True) -> True
  _ -> False

-- The functions 'pickIf*' should evaluate to the following:
-- pickIf True (x, y) -> x
-- pickIf False (x, y) -> y

pickIfPat :: Bool -> (a, a) -> a
pickIfPat True (a, b) = a
pickIfPat False (a, b) = b

pickIfGuard :: Bool -> (a, a) -> a
pickIfGuard b t | b == True = fst t
                | otherwise = snd t

pickIfCase :: Bool -> (a, a) -> a
pickIfCase b t = case b of
  True -> fst t
  False -> snd t
