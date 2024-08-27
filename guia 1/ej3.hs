
sumasParciales :: [Int] -> [Int]
sumasParciales l =  reverse . snd . foldl (\(prevSum, acu) x -> (prevSum + x, ((prevSum + x) : acu))) (0, [])

sumasParcialess :: [Int] -> [Int]
sumasParcialess = reverse . snd . foldl (\(prevSum, acc) x -> let newSum = prevSum + x in (newSum, newSum : acc)) (0, [])
