module Exercise_3 where

data Tree a = Leaf a | Node (Tree a) (Tree a)

numLeaves :: Tree a -> Int
numLeaves (Leaf _) = 1
numLeaves (Node l r) = numLeaves l + numLeaves r

numLeavesTest = numLeaves (Node (Node (Leaf 1) (Leaf 2)) (Leaf 3))

balanced :: Tree a -> Bool
balanced (Leaf _) = True
balanced (Node l r) = isNodeBalanced && balanced l && balanced r
  where
    isNodeBalanced = abs (numLeaves l - numLeaves r) <= 1

balancedTestTrue = balanced (Node (Node (Leaf 1) (Leaf 2)) (Leaf 3))

balancedTestFalse = balanced (Node (Node (Node (Leaf 1) (Leaf 2)) (Leaf 3)) (Leaf 4))

main = do
  print numLeavesTest
  print balancedTestTrue
  print balancedTestFalse
