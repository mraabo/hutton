module Exercise_6 where

approxes :: Double -> [Double]
approxes n = iterate next 1
           where next a = (a + n/a) / 2
                 
sqroot :: Double -> Double
sqroot n = findApprox 0
           where findApprox i | abs ((approxList !! i) - (approxList !! (i+1))) <= 0.00001 = approxList !! (i+1)
                              | otherwise = findApprox (i+1)
                 approxList = take 10 (approxes n)


main = do
  sqroot 2
