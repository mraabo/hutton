module Exercise_4 where

import Countdown

valid' :: Op -> Int -> Int -> Bool
valid' Add _ _ = True
valid' Sub x y = x > y
valid' Mul _ _ = True
valid' Div x y = x `mod` y == 0

eval' :: Expr -> [Int]
eval' (Val n) = [n | n > 0]
eval' (App o l r) = [apply o x y | x <- eval' l, y <- eval' r, valid' o x y]


numPossibleExprs = length [y | x <- choices [1, 3, 7, 10, 25, 50], y <- exprs x]
-- 33.665.406
numEvaluableExprs = length [z | x <- choices [1, 3, 7, 10, 25, 50], y <- exprs x, z <- eval' y]
-- 4.672.540
