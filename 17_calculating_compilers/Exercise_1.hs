module Exercise_9 where


type Stack = [Int]
data Expr = Val Int | Add Expr Expr | Throw | Catch Expr Expr

eval :: Expr -> Maybe Int
eval (Val n) = Just n
eval (Add x y) = case eval x of
                   Just n -> case eval y of
                     Just m -> Just (n + m)
                     Nothing -> Nothing
                   Nothing -> Nothing
eval Throw = Nothing
eval (Catch x h) = case eval x of
                     Just n -> Just n
                     Nothing -> eval h

{-
We use the correctness equations:
1. exec (comp e) s = eval e : s
2. exec (comp’ e c) s = exec c (eval e : s)

to develop functions on the form
exec 'c s
where 'c is some CODE function
and the functions
comp :: Expr -> Code
comp' :: Expr -> Code -> Code

In the base case of Val n:
exec (comp' (Val n) c) s
= {apply eq 2}
exec c (eval (Val n) : s)
= {apply eval}
exec c ((Just n) : s)
= {define data Code = PUSH Int Code, where PUSH :: Int -> Code -> Code
   and define exec (PUSH n c) s = exec c (n:s), unapply exec}
exec (PUSH (Just n) c) s
From start and end result we see that
comp' (Val n) c = PUSH (Just n) c

Base case of Throw:
exec (comp' Throw c) s
= {apply eq 2}
exec c (eval Throw : s)
= {apply eval}
exec c (Nothing : s)
where we see that
comp' Throw c = Nothing

TODO: fix induction of ADD
Inductive case of Add x y:
exec (comp' (Add x y) c) s
= {apply eq 2}
exec c (eval (Add x y) : s)
= {apply eval, which branches into three cases}

Both Just case:
exec c ((Just (n+m)) : s)
= {define data Code = ADD code, where ADD::Code -> Code
   and define exec (ADD c) ((Just m) : (Just n) : s) = exec c (Just (n+m) : s),
   unapply exec}
exec (Add c) ((Just m) : (Just n) : s)

x is Nothing case:
exec c (Nothing : s)
= {define exec (ADD c) ((Just m) : Nothing : s) = exec c (Nothing : s),
   unapply exec}
exec (ADD c) ((Just m) : Nothing : s)

y is Nothing case:
exec c (Nothing : s)
= {define exec (ADD c) (Nothing : (Just n) : s) = exec c (Nothing : s),
   unapply exec}
exec (ADD c) (Nothing : (Just n) : s)



With all these derivation we end up with:
-}


data Code = PUSH Int Code | ADD Code
          deriving Show
comp :: Expr -> Code


comp' :: Expr -> Code -> Code
comp' (Val n) c = PUSH (Just n) c
comp' Throw c = Nothing


exec :: Code -> Stack -> Stack
exec (PUSH n c) s = exec c (n:s)

exec (ADD c) ((Just m) : (Just n) : s) = exec c (Just (n+m) : s)
exec (ADD c) ((Just m) : Nothing : s) = exec c (Nothing : s)
exec (ADD c) (Nothing : (Just n) : s) = exec c (Nothing : s)

