mapPares :: (a -> b -> c) -> [(a,b)] -> [c]
mapPares f [] = []
mapPares f (x:xs) = ((uncurry f) x) : (mapPares f xs)

sumarPares :: [(Int, Int)] -> [Int]
sumarPares = mapPares (\x y -> x + y)

-- #######################################################################

armarPares :: [a] -> [b] -> [(a,b)]
armarPares [] = const []
armarPares (x:xs) = \y -> if null y then [] else (x, head y):(armarPares xs $ tail y)

-- #######################################################################

mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble f xs ys = mapPares f $ armarPares xs ys


mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble f = mapPares f $ armarPares 

-- ^^^ aca no podemos usar $ ya que es como si directamente le estuviesemos pasandoo armarPares como argumento a (mapPares f)
-- lo cual es un error de type.

mapDoble :: (a -> b -> c) -> [a] -> [b] -> [c]
mapDoble f = (mapPares f) . armarPares

-- creo q la composicion toma solo funciones de un solo argumento.
-- armarPares :: [a] -> [b] -> [(a,b)]
-- cuando le paso el primer argumento a armar pares, este le devuelve a mapPares f un ([b] -> [(a,b)]), lo cual
-- no tipa con lo que espera mapPares f :: [(a,b)] -> [c]