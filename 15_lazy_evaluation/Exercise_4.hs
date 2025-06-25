module Exercise_4 where

fibs :: [Integer]
fibs = 0 : 1 : [x + y | (x,y)  <- zip fibs (tail fibs)]
     
main = do
  take 10 fibs
