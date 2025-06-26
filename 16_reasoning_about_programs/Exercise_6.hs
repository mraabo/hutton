module Exercise_6 where

data Tree = Leaf Int | Node Tree Tree

countLeaves :: Tree -> Int
countLeaves (Leaf _) = 1
countLeaves (Node l r) = countLeaves l + countLeaves r

countNodes :: Tree -> Int
countNodes (Leaf _) = 0
countNodes (Node l r) = 1 + countNodes l + countNodes r

main = do
  let tree = Node (Node (Leaf 1) (Leaf 2)) (Leaf 3)
  print (countLeaves tree)
  print (countNodes tree)


{-

Show that
countLeaves tree - countNodes tree = 1

base case: tree = Leaf x
countLeaves (Leaf x) - (countNodes (Leaf x))
= {apply countLeaves}
1 - countNodes (Leaf x)
= {apply countNodes}
1 - 0
= {apply subtraction}
1


Induction case
assume that 
countLeaves tree - countNodes tree = 1
and show that
countLeaves (Node l r) - countNodes (Node l r) = 1

countLeaves (Node l r) - countNodes (Node l r)
= {apply countLeaves}
countLeaves l + countLeaves r - countNodes (Node l r)
= {apply countNodes}
countLeaves l + countLeaves r - (1 + countNodes l + countNodes r)
= {distributivity of - and associativity of - and +}
(countLeaves l - countNodes l) + (countLeaves r - countNodes r) - 1
= {induction hypothesis}
1 + 1 - 1
= {applying - and +}
1

-}
