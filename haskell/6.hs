is_prime_rec :: Int -> Int -> Bool
is_prime_rec number index= 
    if (index == ((round(sqrt (fromIntegral number))) + 1)) then True
    else 
        if ((mod number index) == 0) then False
        else (is_prime_rec number (index + 1)) 

is_prime :: Int -> Bool
is_prime number 
    | number < 2 = False 
    | number == 3 = True 
    | number == 5 = True 
    | number == 4 = False 
    | otherwise = (is_prime_rec number 2)

gen_prime_rec :: Int -> Int -> [Int] -> [Int]
gen_prime_rec number index list = 
    if (index > number) then list
    else 
        if (is_prime index) then (gen_prime_rec number (index + 1) (index:list))
        else (gen_prime_rec number (index + 1) (list))

gen_prime :: Int -> [Int]
gen_prime number = (gen_prime_rec number 2 [])


main = print (gen_prime 12)