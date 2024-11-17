module Exercise_10 where

import Exercise_9 (altMap)

luhnDouble :: Int -> Int
luhnDouble n =
  if (nDouble > 9)
    then nDouble - 9
    else nDouble
  where
    nDouble = 2 * n

luhn :: [Int] -> Bool
luhn xs = luhnSum `mod` 10 == 0
  where
    luhnSum = sum $ altMap luhnDouble id xs

{-
luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d =
  if (sum `mod` 10 == 0)
    then True
    else False
  where
    sum = (luhnDouble a) + b + (luhnDouble c) + d
-}

res = luhn [1, 7, 8, 4]

main = print res
