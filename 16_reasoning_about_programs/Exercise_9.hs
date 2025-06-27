module Exercise_9 where


data Maybe a = Nothing | Just a
  deriving (Eq, Ord)

instance Applicative Maybe where
  -- pure :: a -> Maybe a
  pure = Just

  -- (<*>) :: Maybe (a -> b) -> Maybe a -> Maybe b
  Nothing <*> _ = Nothing
  (Just g) <*> mx = fmap g mx

{-
The applicative laws are:
1. pure id <*> x = x
2. pure (g x) = pure g <*> pure x
3. x <*> pure y = pure (\g -> g y) <*> x
4. x <*> (y <*> z) = (pure (.) <*> x <*> y) <*> z

Proving law 1:
pure id <*> x
= {apply pure}
Just id <*> x
= {apply <*>}
fmap id x
= {apply fmap id}
x

Proving law 2:
pure g <*> pure x
= {apply pure}
Just g <*> Just x
= {apply <*>}
fmap g (Just x)
= {apply fmap}
Just (g x)
= {unapply pure}
pure (g x)


Proving law 3:

Case x = Nothing:
Left-hand side:
Nothing <*> pure y
= {apply <*>}
Nothing

Right-hand side:
pure (\g -> g y) <*> Nothing
= {apply pure}
Just (\g -> g y) <*> Nothing
= {apply <*>}
fmap (\g -> g y) Nothing
= {apply fmap}
Nothing

Case x = Just f
Left-hand side:
Just f <*> pure y
= {apply <*>}
fmap f (pure y)
= {apply pure}
fmap f (Just y)
= {apply fmap}
Just (f y)

Right-hand side:
pure (\g -> g y) <*> Just f
= {apply pure}
Just (\g -> g y) <*> Just f
= {apply <*>}
fmap (\g -> g y) (Just f)
= {apply fmap}
Just (f y)


Proving law 4:

(pure (.) <*> x <*> y) <*> z
= {apply pure}
(Just (.) <*> x <*> y) <*> z
= {apply first <*>}
((fmap (.) x) <*> y) <*> z
= {apply fmap which branches into two cases for x}

Case x = Nothing
(Nothing <*> y) <*> z
= {apply <*> twice}
Nothing
= {unapply <*>}
Nothing <*> (y <*> z)

Case x = Just f
(Just (f .) <*> y) <*> z
= {apply <*>}
fmap (f .) y <*> z
= {apply fmap which brances into two cases for y}

Case y = Nothing
Nothing <*> z
= {unapply fmap}
fmap f (Nothing <*> z)
= {unapply <*>}
Just f <*> (Nothing <*> z)

Case y = Just g
Just (f . g) <*> z
= {apply <*>}
fmap (f . g) z
= {apply fmap which brances into two cases for z}

Case z = Nothing
Nothing
= {unapply fmap}
fmap g Nothing
= {unapply <*>}
Just g <*> Nothing
= {unapply fmap}
fmap f (Just g <*> Nothing)
= {unapply <*>}
Just f <*> (Just g <*> Nothing)

Case z = Just h
Just (f (g h))
= {unapply pure}
pure (f (g h))
= {apply law 2}
pure f <*> pure (g h)
= {apply law 2}
pure f <*> (pure g <*> pure h)
= {apply pure}
Just f <*> (Just g <*> Just h)

-}
