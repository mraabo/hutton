module Exercise_3 where

instance Functor ((->) r) where
  -- General fmap :: (a -> b) -> f a -> f b
  -- fmap :: (a -> b) -> (r -> a) -> (r -> b)
  -- (.) :: (b -> c) -> (a -> b) -> (a -> c)
  fmap g = (.)


instance Applicative ((->) r) where
  -- General pure :: a -> f a
  -- pure :: a -> (r -> a)
  pure x = const

  -- General (<*>) :: f (a -> b) -> f a -> f b
  -- (<*>) :: (r -> (a -> b)) -> (r -> a) -> (r -> b)
  -- left:
  -- g :: r -> (a -> b)
  -- h :: r -> a
  -- g <*> h :: r -> b
  -- right:
  -- x :: r
  -- \x -> g x :: r -> (a -> b)
  -- h x :: a
  -- \x -> g x (h x) :: r -> b
  g <*> h = \x -> g x (h x)
