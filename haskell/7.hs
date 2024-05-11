sum_inside :: [Int] -> Int
sum_inside [] = 0
sum_inside (x:xs) =
    x + (sum_inside xs)

list_sum :: [[Int]] -> Int
list_sum [] = 0
list_sum (x:xs) = 
    (sum_inside x) + (list_sum xs)

--main = print (list_sum [[],[],[]])
--main = print (list_sum [[1],[],[5]])
--main = print (list_sum [[],[1,2,3],[5]])