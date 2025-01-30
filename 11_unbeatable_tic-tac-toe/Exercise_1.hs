module Exercise_1 where

import TicTacToe

size = 3

numNodes :: Tree a -> Int
numNodes (Node _ []) = 1
numNodes (Node _ ts) = 1 + sum (map numNodes ts)

maxdepth :: Tree a -> Int
maxdepth (Node _ []) = 0
maxdepth (Node _ ts) = 1 + maximum (map maxdepth ts)

printCounts :: IO ()
printCounts = do
  let tree = gametree empty O
  print (numNodes tree) -- 549946
  print (maxdepth tree) -- 9
