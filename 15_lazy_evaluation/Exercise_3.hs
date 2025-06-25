module Exercise_3 where

{-
mult 3 4
= {applying mult}
(\x -> (\y -> x * y)) 3 4
= {applying outer lambda function}
(\y -> 3 * y) 4
= {applying lambda function}
3 * 4
= {applying *}
12

-}
