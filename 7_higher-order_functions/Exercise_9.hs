module Exercise_9 where

altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap f g [] = []
altMap f g (x : xs) = f x : altMap g f xs

res1 = altMap (+ 10) (+ 100) [0, 1, 2, 3, 4]

main = print res1
