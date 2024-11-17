module Exercise_6 where

import Control.Applicative
import Data.Char
import Parsing_tools

expr :: Parser Int
expr = do
  t <- term
  do
    symbol "+"
    e <- expr
    return (t + e)
    <|> do
      symbol "-"
      e <- expr
      return (t - e)
    <|> return t

term :: Parser Int
term = do
  f <- factor
  do
    symbol "*"
    t <- term
    return (f * t)
    <|> do
      symbol "/"
      t <- term
      return (f `div` t)
    <|> return f

factor :: Parser Int
factor =
  do
    symbol "("
    e <- expr
    symbol ")"
    return e
    <|> token int

eval :: String -> Int
eval xs = case parse expr xs of
  [(n, [])] -> n
  [(_, out)] -> error ("Unused input " ++ out)
  [] -> error "Invalid input"
