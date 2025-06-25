module Exercise_1 where
{-
Redexes in 1 + (2*3):
(2*3): both outermost and innermost

Redexes in (1+2) * (2+3):
1+2: both outermost and (leftmost) innermost
2+3: both outermost and innermost

Redexes in fst (1+2, 2+3):
fst (1+2, 2+3): outermost
1+2: (leftmost) innermost
2+3: innermost

Redexes in (\x -> 1 + x) (2*3):
(\x -> 1 + x) (2*3): outermost
2*3: innermost


-}
