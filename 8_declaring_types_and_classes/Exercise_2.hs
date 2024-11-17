module Exercise_2 where

data Tree a = Leaf a | Node (Tree a) a (Tree a)

oldOccurs :: (Ord a) => a -> Tree a -> Bool
oldOccurs x (Leaf y) = x == y
oldOccurs x (Node l y r)
  | x == y = True
  | x < y = occurs x l
  | otherwise = occurs x r

occurs :: (Ord a) => a -> Tree a -> Bool
occurs x (Leaf y) = case compare x y of
  EQ -> True
  _ -> False
occurs (Node l y r) = case compare x y of
  EQ -> True
  LT -> occurs x l
  GT -> occurs x r

-- Using compare and the ordering type is more effecient than in oldOccurs, since
-- we can use case analysis to only evaluate the conditional once and then branch immediately
-- while oldOccurs needs to evalaute the next case if the first fails.
