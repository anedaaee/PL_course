fac :: Maybe Int -> Maybe Int
fac Nothing = Nothing
fac (Just number) = 
    if (number <= 0) then 
        (Just 0)
    else
        Just(foldr (*) 1 [1..number])

main = do 
    print(fac (Just 0))
    print(fac (Just 1))
    print(fac (Just 5))