module Exercise_2 where
  
instance Monoid b => Monoid (a -> b) where
  -- mempty :: a -> b
  mempty = \_ -> mempty

  -- mappend :: (a -> b) -> (a -> b) -> (a -> b)
  f1 `mappend` f2 = \x -> f1 x `mappend` f2 x 
