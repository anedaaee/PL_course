
get_samller:: Int -> [Int] -> [Int]
get_samller number [] = []
get_samller number (first:list) = 
    if (first < number) then first:(get_samller number list)
    else (get_samller number list) 
    
get_greater:: Int -> [Int] -> [Int]
get_greater number [] = []
get_greater number (first:list) = 
    if (first >= number) then first:(get_greater number list)
    else (get_greater number list) 

quick_sort :: [Int] -> [Int]
quick_sort [] = []
quick_sort (pivot:list) = 
    quick_sort (get_samller pivot list) ++ [pivot] ++ (get_greater pivot list)

main = print (quick_sort [9,3,4,2,1,6,4,3,0])