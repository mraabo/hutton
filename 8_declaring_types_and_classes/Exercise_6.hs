module Exercise_6 where

import Exercise_5 (Expr (..), folde)

eval :: Expr -> Int
eval = folde id (+)

evalTest = eval (Add (Val 40) (Val 2))

size :: Expr -> Int
size = folde (const 1) (+)

sizeTest = size (Add (Val 1) (Add (Val 2) (Val 3)))

main = do
  print evalTest
  print sizeTest
