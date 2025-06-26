module Exercise_2 where


data Nat = Zero | Succ Nat

add :: Nat -> Nat -> Nat
add Zero m = m
add (Succ n) m = Succ (add n m)


{-
Using the rules
1. add n (Succ m) = Succ (add n m)
2. add n Zero = n

To use induction on n to show
add n m = add m n



Base case: n = Zero
add Zero m
= {apply add}
m
= {rule 2}
add m Zero


Inductive case: assume add n m = add m n
and show it for add (Succ n) m = add m (Succ n)

add (Succ n) m
= {apply add}
Succ (add n m)
= {induction hypothesis}
Succ (add m n)
= {rule 1}
add m (Succ n)

-}
