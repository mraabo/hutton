module Exercise_5 where

adder :: IO ()
adder = do
  putStr "How many numbers "
  n <- readInt
  numList <- addNums n
  putStr "The total is "
  putStrLn (show $ sum numList)


addNums :: Int -> IO [Int]
addNums n = sequence (replicate n readInt)

readInt :: IO Int
readInt = do
  x <- getLine
  return (read x :: Int)
