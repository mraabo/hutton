module Exercise_11 where


comp :: Expr -> Code
comp (Val n) = [PUSH n]
comp (Add x y) = comp x ++ comp y ++ [ADD]
{-
Using the given equation:
comp' e c = comp e ++ c

Base case: e = Val n
comp' (Val n) c
= {apply equation}
comp (Val n) ++ c
= {apply comp}
[PUSH n] ++ c
= {apply ++}
PUSH n : c


Inductive case e = Add x y
comp' (Add x y) c
= {apply equation}
comp (Add x y) ++ c
= {apply comp}
comp x ++ comp y ++ [ADD] ++ c
= {apply last ++}
comp x ++ comp y ++ (ADD : c)
= {unapply equation on comp y}
comp x ++ comp' y (ADD : c)
= {unapply equation}
comp' x (comp' y (ADD : c))

-}
