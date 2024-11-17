module Exercise_1 where

data Nat = Zero | Succ Nat
  deriving (Show)

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)

mult :: Nat -> Nat -> Nat
mult Zero n = Zero
mult (Succ m) n = add (mult m n) n

mul :: Int -> Int -> Int
mul 0 n = 0
mul m n = n + mul (m - 1) n

addRes = add (Succ (Succ Zero)) (Succ Zero)

multRes = mult (Succ (Succ (Succ Zero))) (Succ (Succ Zero))

main = do
  print addRes
  print multRes
