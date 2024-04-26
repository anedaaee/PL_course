sum_inside :: [Int] -> Int
sum_inside [] = 0
sum_inside (x:xs) =
    x + (sum_inside xs)

list_sum :: [[Int]] -> Int
list_sum [] = 0
list_sum (x:xs) = 
    (sum_inside x) + (list_sum xs)

main = print (list_sum [[9,8,7,6],[5,4,3],[2,1]])