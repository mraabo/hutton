module Exercise_7 (Bit, decode, encode) where

import Data.Char

type Bit = Int

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

parity :: [Bit] -> Bit
parity bits = sum bits `mod` 2

addParity :: [Bit] -> [Bit]
addParity bits = parity bits : bits

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

encode :: String -> [Bit]
encode = concat . map (addParity . make8 . int2bin . ord)

bin2int :: [Bit] -> Int
bin2int = foldr (\x y -> x + 2 * y) 0

chop9 :: [Bit] -> [[Bit]]
chop9 [] = []
chop9 bits = take 9 bits : chop9 (drop 9 bits)

checkParity :: [Bit] -> [Bit]
checkParity bits
  | head bits == parity (tail bits) = tail bits
  | otherwise = error "Parity error"

decode :: [Bit] -> String
decode = map (chr . bin2int . checkParity) . chop9

channel :: [Bit] -> [Bit]
channel = id

transmit :: String -> String
transmit = decode . channel . encode

main = do
  print $ transmit "higher-order functions are really easy"
