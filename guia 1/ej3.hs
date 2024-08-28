
sumasParciales :: [Int] -> [Int]
sumasParciales =  reverse . snd . foldl (\(prevSum, acu) x -> (prevSum + x, ((prevSum + x) : acu))) (0, [])

sumasParcialess :: [Int] -> [Int]
sumasParcialess = reverse . snd . foldl (\(prevSum, acc) x -> let newSum = prevSum + x in (newSum, newSum : acc)) (0, [])

-- ##############################################################################

sumaAlt' :: [Int] -> Int
sumaAlt' [] = 0
sumaAlt' (x:xs) = x - (sumaAlt' xs)

sumaAlt :: [Int] -> Int
sumaAlt = foldr (\x acc -> x - acc) 0

-- ###########################################################################3

sumaAltL :: [Int] -> Int
sumaAltL = foldl (\acc x -> x - acc) 0
