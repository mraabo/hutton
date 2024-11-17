module Exercise_1 where

putStr' :: String -> IO ()
putStr' [] = return ()
putStr' xs = sequence_ [putChar x | x <- xs]
