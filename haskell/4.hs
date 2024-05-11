luhnDouble :: Int -> Int
luhnDouble number = 
    if (number > 9) then
        -1
    else
        if ((number * 2) > 9) then (number * 2) - 9
        else number

--main = print(luhnDouble 10)
--main = print(luhnDouble 1)
--main = print(luhnDouble 8)