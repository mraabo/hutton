module Exercise_3 where

import TicTacToe

import Data.Sort

bestmove :: Grid -> Player -> Grid
bestmove g p = head [g' | Node (g', p') _ <- sortOn maxdepth ts, p' == best]
  where
    tree = prune depth (gametree g p)
    Node (_, best) ts = minimax tree

maxdepth :: Tree a -> Int
maxdepth (Node _ []) = 0
maxdepth (Node _ ts) = 1 + maximum (map maxdepth ts)
