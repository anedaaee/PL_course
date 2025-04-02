flatten :: [[Int]] -> [Int] 
flatten [] = []
flatten (x:xs) = 
    x ++ flatten xs

main = do 
    print (flatten [[1],[],[]])
    print (flatten [[1,1],[2,1],[5]])
    print (flatten [[],[1,2,3],[4]])