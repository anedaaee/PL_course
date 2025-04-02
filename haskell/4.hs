luhnDouble :: Int -> Int
luhnDouble number = 
    if (number > 9) then
        -1
    else
        if ((number * 2) > 9) then (number * 2) - 9
        else number * 2

main = do
    print(luhnDouble 10)
    print(luhnDouble 1)
    print(luhnDouble 8)