module Exercise_1 where


data Nat = Zero | Succ Nat

add :: Nat -> Nat -> Nat
add Zero m = m
add (Succ n) m = Succ (add n m)

{-
Proof that
add n (Succ m) = Succ (add n m)

Base case: n = Zero
add Zero (Succ m)
= {apply add}
Succ m
= {unapply add}
Succ (add Zero m)


Inductive case: assume add n (Succ m) = Succ (add n m)
and show add (Succ n) (Succ m) = Succ (add (Succ n) m)

add (Succ n) (Succ m)
= {apply add}
Succ (add n (Succ m))
= {induction hypothesis}
Succ (Succ (add n m))
= {unapply add}
Succ (add (Succ n) m)

-}
