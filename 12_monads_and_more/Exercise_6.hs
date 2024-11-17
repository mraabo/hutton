module Exercise_6 where


instance Functor ((->) r) where
  -- General fmap :: (a -> b) -> f a -> f b
  -- fmap :: (a -> b) -> (r -> a) -> (r -> b)
  -- (.) :: (b -> c) -> (a -> b) -> (a -> c)
  fmap = (.)

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


instance Monad ((->) r) where
  -- General return :: a -> m a
  -- return :: a -> (r -> a)
  return = const

  -- General (>>=) :: m a -> (a -> m b) -> m b
  -- (>>=) :: (r -> a) -> (a -> (r -> b)) -> (r -> b)
  -- left:
  -- g :: r -> a
  -- f :: a -> (r -> b)
  -- g >>= f :: r -> b
  -- right:
  -- x :: r
  -- g x :: a
  -- \x -> g x :: r -> a
  -- f (g x) :: (r -> b)
  -- f (g x) x :: b
  -- \x -> f (g x) :: r -> b
  g >>= f = \x -> f (g x) x
