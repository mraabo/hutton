dec2int :: [Int] -> Int
dec2int = foldl (\x xs -> 10*x + xs) 0

res = dec2int [2,3,4,5]

main = print res
