sum_func :: Maybe Int -> Maybe Int -> Maybe Int
--sum_func Nothing Nothing = Nothing
sum_func num1 Nothing = num1
sum_func Nothing num2   = num2
sum_func (Just num1) (Just num2) = Just ( num1 + num2 )


main = do 
    print(sum_func Nothing Nothing)
    print(sum_func Nothing (Just 5))
    print(sum_func (Just 3) Nothing)
    print(sum_func (Just 7) (Just 8))


