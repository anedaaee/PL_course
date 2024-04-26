merge:: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = 
    if (x <= y) then x : (merge xs (y:ys))
    else y : (merge (x:xs) ys)

main = print (merge [2,5,6] [3,4,7])
