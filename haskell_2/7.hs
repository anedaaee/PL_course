remove_element :: [Int] -> Int -> [Int]
remove_element [] _ = []
remove_element (y:ys) x 
    | x ==  y   = remove_element ys x 
    | otherwise = y : remove_element ys x

erarosthenes_reduce:: [Int] -> Int -> Int -> Int -> [Int]
erarosthenes_reduce list p start_p max_number =
    if p > max_number 
        then list
        else erarosthenes_reduce (remove_element list p) (p+start_p) start_p max_number

erarosthenes_start:: [Int] -> Int -> [Int]
erarosthenes_start [] _ = []
erarosthenes_start (x:xs) max_number = 
    x : erarosthenes_start (erarosthenes_reduce xs (x+x) (x) max_number) max_number

erarosthenes:: Int -> [Int]
erarosthenes number = 
    erarosthenes_start [2..number] number

--main = print(erarosthenes 121)
--main = print(erarosthenes 2)
--main = print(erarosthenes 3)
--main = print(erarosthenes 4)
--main = print(erarosthenes 30)
--main = print(erarosthenes 100)

