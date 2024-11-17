module Exercise_4 where

{-
The final simplification streamlines associativity and ensures that only a single
syntax tree can be produced. It also makes parsing more efficient since some terms in expression
can skip a production compared to the other version, e.g. 1+2 skips
a production from expr to term for the first number in
expr ::== term + expr compared to expr ::== expr + expr.
-}
