module Exercise_7 where

import Prelude hiding (fmap)

data Expr a = Var a | Val Int | Add (Expr a) (Expr a)
        deriving Show

instance Functor Expr where
-- fmap :: (a -> b) -> Expr a -> Expr b
fmap _ (Val n) = Val n
fmap g (Var x) = Var (g x)
fmap g (Add e1 e2) = Add (fmap g e1) (fmap g e2)


instance Applicative Expr where
  -- pure :: a -> Expr a
  pure = Var
  -- <*> :: Expr (a -> b) -> Expr a -> Expr b
  Var g <*> Var x = Var (g x)
  _ <*> Val n = Val n
  Val n <*> _ = Val n
  Var g <*> Add x y = Add (fmap g x) (fmap g y)
  Add f g <*> x = Add (f <*> x) (g <*> x)


instance Monad Expr where
  -- return :: a -> Expr a
  return = pure
  -- (>>=) :: Expr a -> (a -> Expr b) -> Expr b
  Val n >>= _ = Val n
  Var x >>= g = g x
  Add x y >>= g = Add (x >>= g) (y >>= g)

example1 = Var 42 >>= \x -> Var (x*2)
example2 = Add (Var 42) (Var 60) >>= \x -> Var (x/2)

main = do
  print example1
  print example2
