module Exercise_4 where

import Data.Char
import Data.List
import System.IO


type Grid = [[Player]]

data Player
  = O
  | B
  | X
  deriving (Eq, Ord, Show)

next :: Player -> Player
next O = X
next B = B
next X = O

-- task b
empty :: Int -> Grid
empty size = replicate size (replicate size B)

full :: Grid -> Bool
full = notElem B . concat

turn :: Grid -> Player
turn g =
  if os <= xs
    then O
    else X
  where
    os = length (filter (== O) ps)
    xs = length (filter (== X) ps)
    ps = concat g

wins :: Player -> Grid -> Bool
wins p g = any line (rows ++ cols ++ dias)
  where
    line = all (== p)
    rows = g
    cols = transpose g
    dias = [diag g, diag (map reverse g)]

-- task b
diag :: Grid -> [Player]
diag g = [g !! n !! n | n <- [0 .. length g - 1]]

won :: Grid -> Bool
won g = wins O g || wins X g

-- task b
putGrid :: Grid -> IO ()
putGrid g = putStrLn . unlines . concat . interleave bar . map showRow $ g
  where
    bar = [replicate ((length g * 4) - 1) '-']

showRow :: [Player] -> [String]
showRow = beside . interleave bar . map showPlayer
  where
    beside = foldr1 (zipWith (++))
    bar = replicate 3 "|"

showPlayer :: Player -> [String]
showPlayer O = ["   ", " O ", "   "]
showPlayer B = ["   ", "   ", "   "]
showPlayer X = ["   ", " X ", "   "]

interleave :: a -> [a] -> [a]
interleave x [] = []
interleave x [y] = [y]
interleave x (y:ys) = y : x : interleave x ys

-- task b
valid :: Grid -> Int -> Bool
valid g i = 0 <= i && i < length g ^ 2 && concat g !! i == B

-- task b
move :: Grid -> Int -> Player -> [Grid]
move g i p =
  if valid g i
    then [chop (length g) (xs ++ [p] ++ ys)]
    else []
  where
    (xs, B:ys) = splitAt i (concat g)

chop :: Int -> [a] -> [[a]]
chop n [] = []
chop n xs = take n xs : chop n (drop n xs)

getNat :: String -> IO Int
getNat prompt = do
  putStr prompt
  xs <- getLine
  if xs /= [] && all isDigit xs
    then return (read xs)
    else do
      putStrLn "ERROR: Invalid number"
      getNat prompt

-- task b
tictactoe :: IO ()
tictactoe = do
  size <- getNat "Determine the length of the winning line, i.e. size of the board:"
  run (empty size) O

run :: Grid -> Player -> IO ()
run g p = do
  cls
  goto (1, 1)
  putGrid g
  run' g p

cls :: IO ()
cls = putStr "\ESC[2J"

type Pos = (Int, Int)

goto :: Pos -> IO ()
goto (x, y) = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")

run' :: Grid -> Player -> IO ()
run' g p
  | wins O g = putStrLn "Player O wins!\n"
  | wins X g = putStrLn "Player X wins!\n"
  | full g = putStrLn "It's a draw!\n"
  | otherwise = do
    i <- getNat (prompt p)
    case move g i p of
      [] -> do
        putStrLn "ERROR: Invalid move"
        run' g p
      [g'] -> run g' (next p)

prompt :: Player -> String
prompt p = "Player " ++ show p ++ ", enter your move: "

data Tree a =
  Node a [Tree a]
  deriving (Show)

-- task c
findNode :: Eq a => a -> Tree a -> Tree a
findNode x t = findSub x t []

-- task c
findSub :: Eq a => a -> Tree a -> [Tree a] -> Tree a
findSub x (Node v []) [] =
   Node v []
findSub x (Node v []) (s:ss) =
   if x == v
       then Node v []
       else findSub x s ss
findSub x (Node v (c:cs)) [] =
   if x == v
       then Node v (c : cs)
       else findSub x c cs
findSub x (Node v (c:cs)) (s:ss)
   | x == v = Node v (c : cs)
   | x == cv = Node cv ct
   | otherwise = Node sv st
   where
       Node cv ct = findSub x c cs
       Node sv st = findSub x s ss

-- task b
moves :: Grid -> Player -> [Grid]
moves g p
  | won g = []
  | full g = []
  | otherwise = concat [move g i p | i <- [0 .. ((length g ^ 2) - 1)]]

prune :: Int -> Tree a -> Tree a
prune 0 (Node x _) = Node x []
prune n (Node x ts) = Node x [prune (n - 1) t | t <- ts]

depth :: Int
depth = 9

minimax :: Tree Grid -> Tree (Grid, Player)
minimax (Node g [])
  | wins O g = Node (g, O) []
  | wins X g = Node (g, X) []
  | otherwise = Node (g, B) []
minimax (Node g ts)
  | turn g == O = Node (g, minimum ps) ts'
  | turn g == X = Node (g, maximum ps) ts'
  where
    ts' = map minimax ts
    ps = [p | Node (_, p) _ <- ts']

-- task c
bestmove :: Grid -> Player -> Tree Grid -> Grid
bestmove g p gt = head [g' | Node (g', p') _ <- ts, p' == best]
  where
    tree = findNode g gt
    Node (_, best) ts = minimax tree

-- Part a+b
main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  order <- askOrder "Press 0 to play first, press 1 to play second"
  size <- getNat "Determine the length of the winning line, i.e. size of the board:"
  if order == 0
    then play (empty size) X
    else play (empty size) O

askOrder :: String -> IO Int
askOrder text = do
  putStr text
  answer <- getLine
  if answer == "0" || answer == "1"
    then return (read answer)
    else askOrder text

-- task c
play :: Grid -> Player -> IO ()
play g p = do
  cls
  goto (1, 1)
  putGrid g
  play' g p (gametree g p)
  where
    gametree g p = Node g [gametree g' (next p) | g' <- moves g p]

play' :: Grid -> Player -> Tree Grid -> IO ()
play' g p gt
  | wins O g = putStrLn "Player O wins!\n"
  | wins X g = putStrLn "Player X wins!\n"
  | full g = putStrLn "It's a draw!\n"
  | p == O = do
    i <- getNat (prompt p)
    case move g i p of
      [] -> do
        putStrLn "ERROR: Invalid move"
        play' g p gt
      [g'] -> play g' (next p)
  | p == X = do
    putStr "Player X is thinking...\n"
    (play $! bestmove g p gt) (next p)
