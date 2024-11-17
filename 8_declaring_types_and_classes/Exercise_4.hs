module Exercise_4 where

data Tree a = Leaf a | Node (Tree a) (Tree a)
  deriving (Show)

{-
halveList :: [a] -> [[a]]
halveList xs = [take half xs, drop half xs]
  where
    half = length xs `div` 2
-}
balance :: [a] -> Tree a
balance [x] = Leaf x
balance xs = Node (balance $ take half xs) (balance $ drop half xs)
  where
    half = length xs `div` 2

balanceTest = balance [1, 2, 3, 4, 5]

main = do
  print balanceTest
