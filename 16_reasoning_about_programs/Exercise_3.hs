module Exercise_3 where

all p [] = True
all p (x:xs) = p x && all p xs


replicate :: Int -> a -> [a]
replicate 0 _ = []
replicate n x = x : replicate (n-1) x

{-
Show that
all (==x) (replicate n x)
is always true, by induction on n.

Base case: n = 0
all (==x) (replicate 0 x)
= {apply replicate}
all (==x) []
= {apply all}
True


Induction case:
assume
all (==x) (replicate n x) = True
to show that
all (==x) (replicate (n+1) x) = True


all (==x) (replicate (n+1) x
= {apply replicate}
all (==x) (x : replicate n x)
= {apply all}
(==x) x && all (==x) (replicate n x)
= {induction hypothesis}
(==x) x && True
= {applying ==}
True && True
= {applying &&}
True

-}
