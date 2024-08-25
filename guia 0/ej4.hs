-- se puede combinar pattern matching y guardas

limpiarChar :: Char -> String -> String
limpiarChar c [] = []
limpiarChar c (x: xs)   
    | c == x = limpiarChar c xs
    | otherwise = x : (limpiarChar c xs)
                    

limpiar :: String -> String -> String
limpiar s t | null s = t
            | otherwise = limpiar (tail s) (limpiarChar (head s) t)


-- #########################################################################

difPromedio :: [Float] -> [Float]
difPromedio x = map (\e -> (e - (sum x)/fromIntegral(length x))) x


-- ########################################################################

todosIgualesValor :: Int -> [Int] -> Bool
todosIgualesValor _ [] = True 
todosIgualesValor e (x:xs) = (e == x) && (todosIgualesValor e xs)

todosIguales :: [Int] -> Bool
todosIguales [] = True
todosIguales x = todosIgualesValor (head x) x