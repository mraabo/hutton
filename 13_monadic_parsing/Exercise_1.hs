module Exercise_1 where

import Control.Applicative
import Data.Char
import Parsing_tools

comment :: Parser ()
comment = do
  string "--"
  many $ sat (/= '\n')
  return ()
