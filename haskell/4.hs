luhnDouble :: Int -> Int
luhnDouble number = 
    if ((number * 2) > 9) then (number * 2) - 9
    else number

main = (luhnDouble 12)