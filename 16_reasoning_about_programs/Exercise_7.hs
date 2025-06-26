module Exercise_7 where


data Maybe a = Nothing | Just a
  deriving (Eq, Ord)

instance Functor Maybe where
    fmap f Nothing = Nothing
    fmap f (Just x) = Just (f x)

{-
The Functor laws:
1. fmap id = id
2. fmap (g . h) = fmap g . fmap h  

We can show law 1 by showing that in both cases
fmap f m = m

Nothing case:
fmap id Nothing
= {apply fmap}
Nothing

Just case:
fmap id (Just x)
= {apply fmap}
Just (id x)
= {apply id}
Just x


We can show law 2 by showing that in both cases
fmap (g . h) m = (fmap g . gmap h) m

Nothing case:
fmap (g . h) Nothing
= {apply fmap}
Nothing
= {unapply fmap}
fmap g Nothing
= {unapply fmap}
fmap g (fmap h Nothing)
= {unapply .}
(fmap g . fmap h) m

Just case:
fmap (g . h) (Just x)
= {apply fmap}
Just ((g . h) x)
= {apply .}
Just (g (h x))
= {unapply fmap}
fmap g (Just (h x))
= {unnapply fmap}
fmap g (fmap h (Just x))
= {unapply .}
(fmap g . fmap h) (Just x)

-}
