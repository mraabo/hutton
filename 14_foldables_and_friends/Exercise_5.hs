module Exercise_5 where

filterF :: Foldable t => (a -> Bool) -> t a -> [a]
filterF g t = foldMap f t
              where f x = if g x then [x] else mempty
