module Exercise_4 where

newtype ZipList a = Z [a] deriving Show


instance Functor ZipList where
  -- fmap :: (a -> b) -> ZipList a -> ZipList b
  fmap g (Z xs) = Z (fmap g xs)


instance Applicative ZipList where
  -- pure :: a -> ZipList a
  pure x = Z [x | _ <- [1..]]

  -- <*> :: ZipList (a -> b) -> ZipList a -> ZipList b
  (Z gs) <$> (Z xs) = Z [g x | x <- xs, g <- gs]
