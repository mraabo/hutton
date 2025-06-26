module Exercise_4 where



{-
Using the definitions
1. [] ++ ys = ys
2. (x:xs) ++ ys = x : (xs ++ ys)


a. show with induction on xs:
xs ++ [] = xs

base case: xs = []
[] ++ []
= {def 1}
[]

induction case:
assume
xs ++ [] = xs
and show that
(x:xs) ++ [] = x:xs


(x:xs) ++ []
= {def 2}
x : (xs ++ [])
= {induction hypothesis}
x:xs


b. show with induction on xs:
xs ++ (ys ++ zs) = (xs ++ ys) ++ zs


base case: xs = []
[] ++ (ys ++ zs)
= {def 1}
ys ++ zs
= {unapply def 1 on ys}
([] ++ ys) ++ zs



induction step:
assume 
xs ++ (ys ++ zs) = (xs ++ ys) ++ zs
to show that
(x:xs) ++ (ys ++ zs) = ((x:xs) ++ ys) ++ zs

(x:xs) ++ (ys ++ zs) = ((x:xs) ++ ys) ++ zs
= {rule 2}
x : (xs ++ (ys ++ zs))
= {induction hypothesis}
x : ((xs ++ ys) ++ zs)
= {unapply rule 2}
(x : (xs ++ ys)) ++ zs
= {unapply rule 2}
((x:xs) ++ ys) ++ zs
-}
