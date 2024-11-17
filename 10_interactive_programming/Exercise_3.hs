module Exercise_3 where

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
putBoard [] = return ()
putBoard xs = sequence_ [putRow n x | (n, x) <- zip [1..] xs]
