module Exercise_5 where

import Countdown

valid' :: Op -> Int -> Int -> Bool
valid' Add _ _ = True
valid' Sub x y = True
valid' Mul _ _ = True
valid' Div x y = y /= 0 && x `mod` y == 0

eval' :: Expr -> [Int]
eval' (Val n) = [n | n > 0]
eval' (App o l r) = [apply o x y | x <- eval' l, y <- eval' r, valid' o x y]


numEvaluableExprs = length [z | x <- choices [1, 3, 7, 10, 25, 50], y <- exprs x, z <- eval' y]
-- 10.839.369
