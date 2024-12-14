module Exercise_2 where

isChoice :: Eq a => [a] -> [a] -> Bool
-- is x:xs chosen from ys
isChoice [] _ = True
isChoice _ [] = False
isChoice (x:xs) ys = elem x ys && isChoice xs (removeFirst x ys)

removeFirst :: Eq a => a -> [a] -> [a]
removeFirst _ [] = []
removeFirst x (y:ys)
  | x == y = ys
  | otherwise = y : removeFirst x ys
