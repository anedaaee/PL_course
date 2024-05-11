flatten :: [[Int]] -> [Int] 
flatten [] = []
flatten (x:xs) = 
    x ++ flatten xs

--main = print (flatten [[1],[],[]])
--main = print (flatten [[1,1],[2,1],[5]])
main = print (flatten [[],[1,2,3],[4]])