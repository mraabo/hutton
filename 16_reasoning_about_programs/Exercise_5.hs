module Exercise_5 where


take 0 _ = []
take _ [] = []
take n (x:xs) = x : take (n-1) xs

drop 0 xs = xs
drop _ [] = []
drop n (_:xs) = drop (n-1) xs

{-
Using the above definitions and the rules
1. [] ++ ys = ys
2. (x:xs) ++ ys = x : (xs ++ ys)
3. xs ++ [] =  xs
4. xs ++ (ys ++ zs) = (xs ++ ys) ++ zs

show by induction on both n and xs that
take n xs ++ drop n xs = xs


base case: n = 0
take 0 xs ++ drop 0 xs
= {apply take}
[] ++ drop 0 xs
= {apply drop}
[] ++ xs
= {rule 1}
xs


base case: xs = []
take n [] ++ drop n []
= {apply take}
[] ++ drop n []
= {apply drop}
[] ++ []
= {rule 1}
[]


Induction case:
assume
take n xs ++ drop n xs = xs
to show that
take (n+1) (x:xs) ++ drop (n+1) (x:xs) = x:xs

take (n+1) (x:xs) ++ drop (n+1) (x:xs)
= {apply take}
(x : (take n xs)) ++ drop (n+1) (x:xs)
= {apply drop}
(x : (take n xs)) ++ drop n xs
= {rule 2}
x : ((take n xs) ++ drop n xs)
= {induction hypothesis}
x:xs
-}
