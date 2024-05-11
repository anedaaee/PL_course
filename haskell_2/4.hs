fac :: Maybe Int -> Maybe Int
fac Nothing = Nothing
fac (Just number) = 
    if (number <= 0) then 
        (Just 0)
    else
        Just(foldr (*) 1 [1..number])

--main = print(fac (Just 0))
--main = print(fac (Just 1))
main = print(fac (Just 5))