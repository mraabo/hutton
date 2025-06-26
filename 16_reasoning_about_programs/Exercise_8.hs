module Exercise_8 where

data Tree a = Leaf a | Node (Tree a) (Tree a)

instance Functor Tree where
-- fmap :: (a -> b) -> Tree a -> Tree b
fmap g (Leaf x) = Leaf (g x)
fmap g (Node l r) = Node (fmap g l) (fmap g r)


{-

Functor laws:
1. fmap id tree = id tree
2. fmap (g . h) tree = (fmap g . fmap h) tree

Proving law 1:

Base case: tree = Leaf x
fmap id (Leaf x)
= {apply fmap}
Leaf (id x)
= {applying id}
Leaf x
= {unapply id}
id (Leaf x)

Induction case:
Assume fmap id tree = id tree
to show that
fmap id (Node l r) = id (Node l r)

fmap id (Node l r)
= {apply fmap}
Node (fmap id l) (fmap id r)
= {induction hypothesis}
Node (id l) (id r)
= {apply id)
Node l r
= {unapply id}
id (Node l r)


Proving law 2:

Base case: tree = Leaf x
fmap (g . h) (Leaf x)
= {apply fmap}
Leaf ((g . h) x)
= {apply .}
Leaf (g (h x))
= {unapply fmap}
fmap g (Leaf (h x))
= {unapply fmap}
fmap h (fmap h (Leaf x))
= {unapply .}
(fmap g . fmap h) (Leaf x)

Induction case:
assume
fmap (g . h) tree = (fmap g . fmap h) tree
to show that
fmap (g . h) (Node l r) = (fmap g . fmap h) (Node l r)

fmap (g . h) (Node l r)
= {apply fmap}
Node (fmap (g . h) l) (fmap (g . h) r)
= {induction hypothesis}
Node ((fmap g . fmap h) l) ((fmap g . fmap h) r)
= {apply. }
Node (fmap g (fmap h l)) (fmap g (fmap h r))
= {unapply fmap}
fmap g (Node (fmap h l) (fmap h r))
= {unapply fmap}
fmap g (fmap g (Node l r))
= {unapply .}
(fmap g . fmap h) (Node l r)

-}
