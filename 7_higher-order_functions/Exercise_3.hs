myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\x xs -> f x : xs) []

mapRes = (map (+1) [1,2], myMap (+1) [1,2])


myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p = foldr (\x xs -> if p x then x:xs else xs) []

filterRes = (filter (>2) [1,2,3,4], myFilter (>2) [1,2,3,4])

main = do
  print mapRes
  print filterRes
