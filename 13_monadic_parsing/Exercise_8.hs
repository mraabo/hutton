module Exercise_8 where


-- a.
{-
grammar:
expr ::== expr (- term | eps)
term ::= nat | eps
nat ::= 0..

e.g.
1-2-3
expr
expr - term
expr - nat
expr - 3
(expr - term) - 3
(nat - nat) - 3
(1 - 2) - 3
-}

-- b.
import Control.Applicative
import Data.Char
import Parsing_tools


badExpr :: Parser Int
badExpr = do
    e <- badExpr
    do
      symbol "-"
      t <- term
      return (e - t)
      <|> return e
-- c.
-- Running this parser results in inifnite recursion because it calls itself to match the
-- first expression and will do so repeatedly forever.


-- d.

leftExpr :: Parser (Int, Char)
leftExpr = do
  t <- term
  symbol "-"
  return (t, '-')

expr :: Parser Int
expr = do
  le <- many leftExpr
  t <- term
  return $ fst $ foldl1 op (le ++ [(t, ' ')])
    -- if right sign is minus them subtract value-left and value-right
    where op (vl, sl) (vr, sr) = (vl - vr, sr)

term :: Parser Int
term = do
  token nat

eval :: String -> Int
eval xs = case parse badExpr xs of
  [(n, [])] -> n
  [(_, out)] -> error ("Unused input " ++ out)
  [] -> error "Invalid input"
