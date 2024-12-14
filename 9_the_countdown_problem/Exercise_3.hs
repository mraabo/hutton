module Exercise_3 where

import Countdown

{-
If split would also return pairs of empty lists, then expr would return
an empty list as a possible expression. This would in turn mean that we
would try to check expressions with empty lists as arguments, which would
not be valid. This would cause the program to crash.

-}

split' :: [a] -> [([a], [a])]
split' [] = []
split' (x:xs) = ([], x:xs) : [(x : ls, rs) | (ls, rs) <- split xs]
