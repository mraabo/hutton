import Exercise_7 (Bit, decode, encode)

channel :: [Bit] -> [Bit]
channel = tail

transmit :: String -> String
transmit = decode . channel . encode

main = do
  print $ transmit "higher-order functions are totally easy"
