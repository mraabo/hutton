module Exercise_1 where


import Countdown (perms, subs)

choices :: [a] -> [[a]]
choices n = [ x2 | x1 <- subs n, x2 <- perms x1]
