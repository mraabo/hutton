module Exercise_2 where

import TicTacToe

import System.Random

bestmove :: Grid -> Player -> Grid
bestmove g p = let bestMoves = [g' | Node (g',p') _ <- ts, p' == best]
                   in bestMoves !! randomRIO (0, length bestMoves - 1)
  where
    tree = prune depth (gametree g p)
    Node (_,best) ts = minimax tree
