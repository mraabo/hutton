module Exercise_8 where

data Prop
  = Const Bool
  | Var Char
  | Not Prop
  | And Prop Prop
  | Imply Prop Prop
  | Or Prop Prop -- Logical disjunctions added.
  | Equiv Prop Prop -- Equavalance added.

type Assoc k v = [(k, v)]

type Subst = Assoc Char Bool

find :: (Eq k) => k -> Assoc k v -> v
find k t = head [v | (k', v) <- t, k == k']

eval :: Subst -> Prop -> Bool
eval _ (Const b) = b
eval s (Var x) = find x s
eval s (Not p) = not (eval s p)
eval s (And p q) = eval s p && eval s q
eval s (Imply p q) = eval s p <= eval s q
eval s (Or p q) = eval s p || eval s q
eval s (Equiv p q) = (eval s p <= eval s q) && (eval s q <= eval s p)


bools :: Int -> [[Bool]]
bools 0 = [[]]
bools n = map (False :) bss ++ map (True :) bss
  where
    bss = bools (n - 1)

vars :: Prop -> [Char]
vars (Const _) = []
vars (Var x) = [x]
vars (Not p) = vars p
vars (And p q) = vars p ++ vars q
vars (Imply p q) = vars p ++ vars q
vars (Or p q) = vars p ++ vars q
vars (Equiv p q) = vars p ++ vars q

rmdups :: (Eq a) => [a] -> [a]
rmdups [] = []
rmdups (x : xs) = x : filter (/= x) (rmdups xs)

substs :: Prop -> [Subst]
substs p = map (zip vs) (bools (length vs))
  where
    vs = rmdups (vars p)

isTaut :: Prop -> Bool
isTaut p = and [eval s p | s <- substs p]


orTestTrue = Or (Var 'A') (Not (Var 'A'))
orTestFalse = Or (Var 'A') (Var 'A')

equivTestTrue = Equiv (Var 'A') (Var 'A')
equivTestFalse = Equiv (Var 'A') (Var 'B')


main = do
  print $ isTaut orTestTrue
  print $ isTaut orTestFalse
  print $ isTaut equivTestTrue
  print $ isTaut equivTestFalse
