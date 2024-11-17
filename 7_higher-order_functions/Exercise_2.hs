--- a.
all' :: (a -> Bool) -> ([a] -> Bool)
all' p = and . map p

allRes = (all' (> 2) [3, 4, 5])

--- b.
any' :: (a -> Bool) -> ([a] -> Bool)
any' p = or . map p

anyRes = (any' (== 2) [1, 2, 3])

--- c.
takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ [] = []
takeWhile' p (x : xs)
  | p x = x : takeWhile' p xs
  | otherwise = []

takeWhileRes = takeWhile' (== 2) [2, 2, 2, 3]

-- d.
dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' p (x : xs)
  | p x = dropWhile' p xs
  | otherwise = (x : xs)

dropWhileRes = dropWhile' (== 2) [2, 2, 2, 3]

main :: IO ()
main = do
  print allRes
  print anyRes
  print takeWhileRes
  print dropWhileRes
