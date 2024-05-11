rect_number_rec :: Int -> Int -> [Int] -> [Int]
rect_number_rec max index list = 
    if(index > max) then list
    else rect_number_rec max (index + 1 ) ((round(((fromIntegral index) * (fromIntegral (index + 1)))/2)) : list)

rect_number :: Int -> [Int]
rect_number max =
    rect_number_rec max 1 []

--main = print (rect_number 0)
--main = print (rect_number 1)
--main = print (rect_number 2)
main = print (rect_number 5)
