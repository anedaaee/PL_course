
flatten :: [[Int]] -> [Int] 
flatten [] = []
flatten (x:xs) = 
    x ++ flatten xs

main = print (flatten [[9,8,7,6],[5,4,3],[2,1]])