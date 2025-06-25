module Exercise_2 where

{-
Innermost evaluation:
fst (1+2, 2+3)
= {applying leftmost +}
fst (3, 2+3)
= {applying +}
fst (3, 5)
= {applying fst}
3

Outermost evaluation:
fst (1+2, 2+3)
= {applying fst}
1+2
= {applying +}
3

We see that outermost evaluation results in one evaluation less than innermost evaluation, which are evaluating the discarded 2+3.
-}
