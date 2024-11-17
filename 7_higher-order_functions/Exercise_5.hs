curry :: ((a, b) -> c) -> (a -> b -> c)
curry f = \a b -> f (a,b)
-- i.e. call (curry f) a b and execute f(a,b)

uncurry :: (a -> b -> c) -> ((a, b) -> c)
uncurry f = \(a,b) -> f a b
-- i.e. call (uncurry f) (a,b) and execute f a b
