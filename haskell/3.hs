merge:: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = 
    if (x <= y) then x : (merge xs (y:ys))
    else y : (merge (x:xs) ys)

--main = print (merge [1] [])
--main = print (merge [] [1])
--main = print (merge [11] [1..10])
--main = print (merge [2,3,7] [1,5,10])
