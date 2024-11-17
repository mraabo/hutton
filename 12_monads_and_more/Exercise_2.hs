module Exercise_2 where

-- (-> a) is a partially applied function type constructor that takes an input of
-- type a and returns a function waiting for the output type.

instance Functor ((->) r) where
  -- General fmap :: (a -> b) -> f a -> f b
  -- fmap :: (a -> b) -> (r -> a) -> (r -> b)
  -- (.) :: (b -> c) -> (a -> b) -> (a -> c)
  fmap = (.)
