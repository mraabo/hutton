module Exercise_10 where



instance Monad [] where
  -- a -> [a]
  return x = [x]
  
  -- (>>=) :: [a] -> (a -> [b]) -> [b]
  xs >>= f = [y | x <- xs, y <- f x]


{-
The monad laws are:
1. return x >>= f = f x
2. mx >>= return = mx
3. (mx >>= f) >>= g = mx >>= (\x -> (f x >>= g))

Proving law 1:
return x >>= f
= {apply return}
[x] >>= f
= {apply >>=}
[y | x' <- [x], y <- f x]
= {evaluate list comprehension}
f x

Proving law 2:
mx >>= return
= {apply >>=}
[y | x <- mx, y <- return x]
= {apply return}
[y | x <- mx, y <- [x]]
= {evaluate list comprehension}
mx

Proving law 3:
Left-hand side:
(mx >>= f) >>= g
= {apply >>=}
[y | x <- mx, y <- f x] >>= g
= {apply >>=}
[y' | x' <- [y | x <- mx, y <- f x], y' <- g x']
= {flatten list comprehension and rename y'=z, x'=y}
[z | x <- mx, y <- f x, z <- g y]

Right-hand side:
mx >>= (\x -> (f x >>= g))
= {apply outer >>=}
[y | x' <- mx, y <- (\x -> (f x >>= g)) x']
= {apply lambda function}
[y | x' <- mx, y <- f x' >>= g]
= {apply >>=}
[y | x' <- mx, y <- [y' | x'' <- f x', y' <- g x'']]
= {flatten list comprehension and rename z=y=y', x=x', y=x''}
[z | x <- mx, y <- f x, z = g y]

-}
