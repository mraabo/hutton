unfold p h t x
  | p x = []
  | otherwise = h x : unfold p h t (t x)

type Bit = Int

chop8 :: [Bit] -> [[Bit]]
chop8 bits = unfold null (take 8) (drop 8) bits

map' :: (a -> b) -> ([a] -> [b])
map' f = unfold null (f . head) tail

iterate' :: (a -> a) -> a -> [a]
iterate' f = unfold (const False) id f

res = (chop8 [1, 1, 1, 1, 0, 0, 0, 0, 1], map' (+ 1) [1, 2])

main = print res
