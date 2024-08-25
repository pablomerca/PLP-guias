import Data.Either

inverso :: Float -> Maybe Float
inverso n 
    | n == 0 = Nothing
    | otherwise = Just (1/n)


-- para llamar a esta funcion tenemos que usar el tipo con either, tira error si llamamos con valores
-- Int o Bool comunes, hay usar los constructores Left y Right.
-- aEntero (Right True)
-- aEntero (Left 99)
aEntero :: Either Int Bool -> Int
aEntero x 
    | isLeft x = (fromLeft 0 x)
    | otherwise = if (fromRight False x) then 1 else 0