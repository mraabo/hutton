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
= {Using PUSH definition}
exec (PUSH Nothing c) s
where we see from start to end that
comp' Throw c = PUSH Nothing c

Inductive case of Add x y:
exec (comp' (Add x y) c) s
= {apply eq 2}
exec c (eval (Add x y) : s)
= {define the operations in eval in terms of applicatives}
 exec c (((+) <*> eval y <*> eval x) : s)
= {define data Code = ADD Code, where ADD :: Code -> Code
   and define exec (ADD c) (n:m:s) = exec c (((+) <*> n <*> m): s)}
exec (ADD c) (eval y : eval x : s)
= {induction hypothesis on y}
exec (comp' y (ADD c)) (eval x : s)
= {induction hypothesis on x}
exec (comp' x (comp' y (ADD c))) s
where we see from the initial expressions that we must have
comp' (Add x y) c = (comp' x (comp' y (ADD c)))

Inductive case of Catch x h:
exec (comp' (Catch x h) c) s
= {apply eq 2}
exec c (eval (Catch x h) : s)
= {define data Code = CATCH Code, where CATCH :: Code -> Code
   and define exec (CATCH x h) s = case (exec x s) of [Just n] -> exec x s
   [Nothing] -> exec h s, applying eval leads to two cases}

case eval x = Just n
exec c (eval x : s)
= {unapply eq 2}
exec (comp' x c) s

case eval x = Nothing
exec c (eval h : s)
= {unapply eq 2}
exec (comp' h c) s

So using the defined CATCH we get
exec c (CATCH (comp' x c) (comp' h c))
where we see from the initial expression that we have
comp' ((Catch x h) c) s = CATCH (comp' x c) (comp' h c)


The finally we consider comp :: Expr -> Code
exec (comp e) s
= {apply eq 1}
eval e : s
= {define data Code = HALT where HALT :: Code
   and define exec HALT s = s}
exec HALT (eval e : s)
= {unapply eq 2}
exec (comp' e HALT) s
where we see from the initial expression that
comp e = comp' e HALT

From all these derivation we finally have:
-}


data Code = PUSH Int Code
          | ADD Code
          | Catch Code
          | HALT
          deriving Show

comp :: Expr -> Code
comp e = comp' e HALT

comp' :: Expr -> Code -> Code
comp' (Val n) c = PUSH (Just n) c
comp' Throw c = PUSH Nothing c
comp' (Add x y) c = (comp' x (comp' y (ADD c)))
comp' (Catch x h) c = CATCH (comp' x c) (comp' h c)


exec :: Code -> Stack -> Stack
exec (PUSH n c) s = exec c (n:s)
exec (ADD c) (n:m:s) = exec c (((+) <*> n <*> m) : s
exec (CATCH x h) s = case (exec x s) of
                       [Just x] -> exec x s
                       [Nothing] -> exec h s
                      

