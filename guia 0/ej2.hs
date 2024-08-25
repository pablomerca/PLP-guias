-- ojo al pasarle los valores de input, los numeros negativos van entre parentesis.
valorAbsoluto :: Float -> Float
valorAbsoluto n | n >= 0 = n
                | otherwise = -1 * n

-- ###################################################################3

bisiesto :: Int -> Bool
bisiesto a = (a`mod`4 == 0) && (a`mod`100 /= 0 || a`mod`400 == 0)

-- ###################################################################3

-- ojo, hay que poner parentesis en el argumento del llamado recursivo
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

-- ###################################################################3

cantDivisoresDesde :: Int -> Int -> Int
cantDivisoresDesde s n  | s > n = 0
                        | otherwise = (if n`mod`s == 0 then 1 else 0) + cantDivisoresDesde (s+1) n 

cantDivisores :: Int -> Int 
cantDivisores n = cantDivisoresDesde 1 n

esPrimo :: Int -> Bool
esPrimo n = (cantDivisores n) == 2

cantDivisoresPrimosDesde :: Int -> Int -> Int
cantDivisoresPrimosDesde s n    | s > n = 0
                                | otherwise = (if (n`mod`s == 0 && (esPrimo s)) then 1 else 0) + cantDivisoresPrimosDesde (s+1) n

cantDivisoresPrimos :: Int -> Int
cantDivisoresPrimos n = cantDivisoresPrimosDesde 2 n
