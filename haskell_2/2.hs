function :: Int -> Bool
function number = 
    if number == 0 
        then False
        else True

filterF :: Foldable t => (a -> Bool) -> t a -> [a]
filterF f = foldr (\x acc -> if f x then x : acc else acc) []


--main = print(filterF function [1, 2, 0, 3, 4, 5, 6, 0, 7, 8, 9, 10])
--main = print(filterF (\x -> x `mod` 2 /= 0) [1..10])
--main = print(filterF (\x -> length x > 4) ["aaaa", "bbbbbbbbbbbbb", "cc"])

theFunction :: Int -> Int -> Bool
theFunction x i = x < i
    

main = print(filterF (flip theFunction 5) [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])