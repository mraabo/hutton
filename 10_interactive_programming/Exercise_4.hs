module Exercise_4 where

adder :: IO ()
adder = do
  putStr "How many numbers "
  n <- readInt
  res <- addNums 0 n
  putStr "The total is "
  putStrLn (show res)


addNums :: Int -> Int -> IO Int
addNums sum 0 = return sum
addNums sum n =
  do
    x <- readInt
    addNums (sum+x) (n-1)

readInt :: IO Int
readInt = do
  x <- getLine
  return (read x :: Int)
