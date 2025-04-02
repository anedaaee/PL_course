normal_return:: [Int] -> [Int]
normal_return [] = []
normal_return (x:xs) = 
    x : double_odd xs
    
double_odd:: [Int] -> [Int]
double_odd [] = []
double_odd (x:xs) = 
    x * 2 : normal_return xs

filter_number_greather_10:: Int -> Int 
filter_number_greather_10 number = 
    if number >= 10 then 
        ((div number 10) + (mod number 10))
    else number

luhn:: [Int] -> Bool
luhn list = 
    (mod (foldr (+) 0 (map filter_number_greather_10 (double_odd list))) 10) == 0
--main = print (luhn [0,9,1,7,5,5,6,0,0,3,7,1,7,3,9,2])
--main = print (luhn [1,0,0,8,4,3,2,2,7,2,8,7,9,7,8,1])
--main = print (luhn [6,1,0,4,3,3,7,8,8,2,9,0,0,7,9,2])
--main = print (luhn [5,8,9,4,6,3,1,5,3,8,9,1,2,9,1,6])