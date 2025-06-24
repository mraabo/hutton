module Exercise_4 where

data Tree a = Leaf | Node (Tree a) a (Tree a)
              deriving Show

instance Functor Tree where
  -- fmap :: (a -> b) -> Tree a -> Tree b
  fmap g Leaf = Leaf
  fmap g (Node l x r) = Node (fmap g l) (g x) (fmap g r)
  

instance Foldable Tree where
  -- fold :: Monoid a => Tree a -> a
  fold Leaf = mempty
  fold (Node l x r) = fold l `mappend` x `mappend` fold r

  -- foldMap :: Monoid b => (a -> b) -> Tree a -> b
  foldMap _ Leaf = mempty
  foldMap f (Node l x r) = foldMap f l `mappend` f x `mappend` foldMap f r

  -- foldr :: (a -> b -> b) -> b -> Tree a -> b
  foldr _ v Leaf = v
  foldr f v (Node l x r) = foldr f (foldr f (f x v) r) l

  -- foldl :: (a -> b -> a) -> a -> Tree b -> a
  foldl _ v Leaf = v
  foldl f v (Node l x r) = foldl f (foldl f (f v x) l) r


instance Traversable Tree where
  -- traverse :: Applicative f => (a -> f b) -> Tree a -> f (Tree b)
  traverse _ Leaf = pure Leaf
  traverse g (Node l x r) = pure Node <*> traverse g l <*> g x <*> traverse g r
  
