-- (map <function> . filter <condition>) x

res1 = [x * 2 | x <- [1, 2, 3], x == 2]

res2 = (map (* 2) . filter (== 2)) [1, 2, 3]

main :: IO ()
main = print (res1, res2)
