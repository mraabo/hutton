module Exercise_5 where

{-
We have that
pure :: a -> f a
(<*>) :: f (a -> b) -> f a -> f b

So for the four applicative laws we can deduce that

1. pure id <*> x = x
left:
id :: a -> a
pure id :: f (a -> a)
x :: f a
pure id <*> x :: f a

right:
x :: f a



2. pure (g x) = pure g <*> pure x
left:
g :: a -> b
x :: a
g x :: b
pure (g x) :: f b

right:
pure g :: f (a -> b)
pure x :: f a
pure g <*> pure x :: f b


3. x <*> pure y = pure (\g -> g y) <*> x
left:
x :: f (a -> b)
y :: a
pure y :: f a
x <*> pure y :: f b

right:
g :: a -> b
g y :: b
\g -> g y :: (a -> b) -> b
pure (\g -> g y) :: f ((a -> b) -> b)
pure (\g -> g y) <*> x :: f b


4. x <*> (y <*> z) = (pure (.) <*> x <*> y) <*> z
left:
y :: f (a -> b)
z :: f a
y <*> z :: f b
x :: f (b -> c)
x <*> (y <*> z) :: f c

right:
(.) :: (b -> c) -> (a -> b) -> (a -> c)
pure (.) :: f ((b -> c) -> (a -> b) -> (a -> c))
pure (.) <*> x :: f ((a -> b) -> (a -> c))
pure (.) <*> x <*> y :: f (a -> c)
(pure (.) <*> x <*> y) <*> z :: f c
-}
