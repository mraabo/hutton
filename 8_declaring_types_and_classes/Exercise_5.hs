module Exercise_5 where

data Expr = Val Int | Add Expr Expr

folde :: (Int -> a) -> (a -> a -> a) -> Expr -> a
folde f g e = case e of
  Val i -> f i
  Add e1 e2 -> folde f g e1 `g` folde f g e2
