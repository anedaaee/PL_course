list_gen_rec :: Int -> Int -> [Float]-> [Float]
list_gen_rec max_num current list = 
    if (max_num == current) then list
    else (list_gen_rec max_num (current+1) ( (fromIntegral(1) / fromIntegral(current)) : list))
        

list_gen :: Int -> [Float]
list_gen max_num = (list_gen_rec max_num 1 [])

main = print (list_gen 10)
