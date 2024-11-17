module Exercise_1 where

data Tree a = Leaf | Node (Tree a) a (Tree a)
  deriving Show

instance Functor Tree where
  fmap g Leaf = Leaf
  fmap g (Node l a r) = Node (fmap g l) (g a) (fmap g r)

testFunctor = fmap even (Node Leaf 1 (Node Leaf 2 Leaf))

main = do
  print testFunctor
