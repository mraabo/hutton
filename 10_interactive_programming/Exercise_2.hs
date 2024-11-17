module Exercise_2 where


type Board = [Int]

initial :: Board
initial = [5,4,3,2,1]

finished :: Board -> Bool
finished = all (== 0)

putRow :: Int -> Int -> IO ()
putRow row num = do putStr (show row)
                    putStr ": "
                    putStrLn (concat (replicate num "* "))

putBoard :: Board -> IO ()
putBoard board = makeBoard 1 board
  where makeBoard row (x:xs) = do
          putRow row x
          makeBoard (row+1) xs
        makeBoard _ [] = return ()
